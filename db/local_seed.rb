
Composer.destroy_all
Composer.reset_pk_sequence
Work.destroy_all
Work.reset_pk_sequence

JSON.parse(File.read("composers.json")).each do |composer|
    c = Composer.new
    c.full_name = composer["complete_name"]
    c.last_name = composer["name"]
    c.birth_year = composer["birth"]
    c.death_year = composer["death"]
    c.epoch = composer["epoch"]
    c.save
end

JSON.parse(File.read("works.json")).each do |works|
    composer = works["composer"]
    works["title"].each do |work|
        w = Work.new
        w.title = work["title"]
        w.composer_id = Composer.find_by(last_name: composer).id
        w.save
    end
end


