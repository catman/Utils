class FileTimer

  NoTimeStampError = Class.new(StandardError)
  
  def initialize(file)
    @file = file
  end
  
  def write_timestamp
    File.open(@file,"w") { |f| f << Time.now.utc.to_s }
  end
  
  def timestamp
    raise NoTimeStampError unless running?
    Time.parse(File.read(@file)).localtime
  end
  
  def elapse_time
    (Time.now.utc - timestamp.utc) / 60.0 / 60.0
  end
  
  def clear_timestamp
    FileUtils.rm_f(@file)
  end
  
  def running?
    File.exist?(@file)
  end

end
  
    