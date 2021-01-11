module ServicesHelper

    def rehearsal_or_concert(service)
        if service.concert 
            "Concert"
        else
            "Rehearsal"
        end
    end

    def service_duration_format(service)
        "#{service.start_time.strftime('%I:%M %P')} - #{service.end_time.strftime('%I:%M %P')}"
    end

    def service_date_format(service)
        "#{service.start_time.strftime('%A, %B %d, %Y')}"
    end

    def service_show_format(service)
        "#{service_date_format(service)} - #{service_duration_format(service)} - #{rehearsal_or_concert(service)}"
    end

    
end
