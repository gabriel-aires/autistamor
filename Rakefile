desc 'Application console'
task :console do
  cmd = "irb"
  gems = ['dotenv/load', 'ohm', 'scrivener', 'scrypt']
  files = Dir["./{models,filters}/*.rb"]
  (gems + files).each { |lib| cmd += " -r " + lib }
  system cmd
end
