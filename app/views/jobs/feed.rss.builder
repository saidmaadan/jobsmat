#encoding: UTF-8

xml.instruct! :xml, :version => "1.0"
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "JobsMat"
    xml.author "Said Maadan"
    xml.description "Job Board and Company Reviews App"
    # xml.link "https://www.jobsmat.com"
    xml.language "en"
    xml.link job_url
    xml.tag! 'atom:link', :rel => 'self', :type => 'application/rss+xml', :href => jobs_url
 

    for job in @jobs
      xml.item do
        if job.title
          xml.title job.title
        else
          xml.title ""
        end
        xml.link job_url(job)
        xml.pubDate job.created_at.to_s(:rfc822)
        #xml.link "http://www.jobsmat.com/job/" + job.id.to_s + "-" + job.alias
        xml.guid job.guid
    
        # if job.logo_url.exists?
        #     image_url = job.logo_url.url(:large)
        #     image_caption = job.logo_url_caption
        #     image_align = ""
        #     image_tag = "
        #         <p><img src='" + image_url +  "' alt='" + image_caption + "' title='" + image_caption + "' align='" + image_align  + "' /></p>
        #       "
        #     text = text.sub('{logo_url}', image_tag)
        # end
        xml.description "<p>" + job.description + "</p>"

      end
    end
  end
end