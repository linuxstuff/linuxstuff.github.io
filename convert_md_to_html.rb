#!/usr/bin/ruby

puts "Start conversion"

Dir.entries("./").each do |file_entry|
  if file_entry.include?(".md")
    puts "File is #{file_entry}"
    base_name = file_entry.gsub(".md","")
    html_file_name = "#{base_name}.html"
    puts "--html_name=#{html_file_name}"
    `markdown #{file_entry} > #{html_file_name}`
  end
end