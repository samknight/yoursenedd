class Import

  attr_accessor :date, :record, :debates

  # Public: Creates a new import function
  #
  # Returns an Import object
  def initialize(date)
    @date = date
  end

  def self.available_days(dates)
    days = []
    dates.each do |date|
      days << date if Import.new(date).available?
    end

    return days
  end

  # Public: Saves record into database
  def save!
    @record = fetch_xml
    save_debates
  end

  # Public: Checks if there is an available record to import
  #
  # Returns a Boolean
  def available?
    begin
      AssemblyWales::Plenary.new(date)
      true
    rescue
      false
    end
  end

  # private

  # Internal: Checks if any debates have been uploaded for this date
  #
  # Returns a Boolean
  def uploaded?
    Debate.where(:log_date => date).size > 0
  end

  # Internal: Gathers speech contributions from the record
  #
  # Returns an Array of AssemblyWales::Speech
  def get_speeches
    @record.speeches.select { |s| (s.contribution_type == "O" || s.contribution_type == "C") }
  end

  # Internal: Loads XML for a given Date
  #
  # date - Date of debate
  #
  # Returns AssemblyWales::Plenary
  def fetch_xml
    AssemblyWales::Plenary.new(date)
  end

  def debates
    get_speeches.group_by { |s| s.agenda_item_id }
  end

  def save_debates
    debates.each do |agenda_id, speeches|
      name = speeches.first.agenda_item_english rescue nil
      if name
        debate = Debate.new(
          name: speeches.first.agenda_item_english,
          name_cy: speeches.first.agenda_item_welsh,
          log_date: @date.to_date,
          tv: video_code(speeches.first.contribution_spoken_seneddtv.match(/tv\/.{2}\/(\d+)\?/)[1], "en"),
          tv_cy: video_code(speeches.first.contribution_spoken_seneddtv.match(/tv\/.{2}\/(\d+)\?/)[1], "cy")
        )
        save_debate_speeches(debate, speeches)
      end
    end
  end

  def save_debate_speeches(debate, speeches)
    speeches.each_with_index do |speech, i|
      next if i != 0 && speech.member_id == speeches[i-1].member_id
      content = ""
      content_cy = ""

      while speeches.size > i && speeches[i].member_id == speech.member_id
        content += " "
        content_cy += " "
        content += english_speech(speeches[i])
        content_cy += welsh_speech(speeches[i])
        i += 1
      end
      date = speech.contributiontime rescue nil
      debate.speeches.build(
        member_id: find_member(speech.member_id),
        log_date: @date.to_date,
        content: content,
        content_cy: content_cy,
        spoke_at: date ? DateTime.parse(date) : nil
      )
    end
    debate.save
  end

  def english_speech(speech)
    if speech.contribution_language == "En"
      speech.contribution_verbatim
    else
      speech.contribution_translated rescue speech.contribution_verbatim
    end
  end

  def welsh_speech(speech)
    if speech.contribution_language == "En"
      speech.contribution_translated rescue speech.contribution_verbatim
    else
      speech.contribution_verbatim
    end
  end

  def video_code(code = "", locale = "en")
    return nil if code.empty?
    if locale == "en"
      res = Net::HTTP.get_response(URI("http://www.senedd.tv/en/#{ code }"))
      res['location'].split('/').last
    else
      res = Net::HTTP.get_response(URI("http://www.senedd.tv/cy/#{ code }"))
      res['location'].split('/').last
    end
  end

  def find_member(member_id)
    case member_id
    when '1'
      Member.find_by!(external_id: 162).id # Elin Jones
    when '2'
      Member.find_by!(external_id: 161).id # Ann Jones
    when '5'
      Member.find_by!(external_id: 136).id # Rosemary Butler
    when '6'
      Member.find_by!(external_id: 102).id # Carwyn Jones
    else
      Member.find_by!(external_id: member_id).id
    end
  end
end
