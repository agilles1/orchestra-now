module WorksHelper



    def composer_year_format(date)
        if date 
            date.strftime('%Y')
        end
    end

end