
require 'json'

database_filename = ARGV[0]
database_index = ENV["SGE_TASK_ID"].to_i - 1

database = JSON.parse(File.open(database_filename, 'r').read)

entry = database[database_index]

command = "#{entry["program"]} #{entry["input"]} -o #{entry["output"]}"
puts command
`#{command}`
