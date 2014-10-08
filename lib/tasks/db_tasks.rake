
desc "re-initializes the database"
task :rdb do 
	silence_stream(STDOUT) do
		Rake::Task["db:drop"].invoke
		Rake::Task["db:create"].invoke
		Rake::Task["db:schema:load"].invoke
	end
		Rake::Task["db:seed"].invoke
end