class WelcomeController < ApplicationController   

  def index
    @location = Location.new
  end

  def delivery
  end
  def search
  end  
  def payment
  end

  def substitution
  end

  def sitemap
  end
 
  def customer_service
  end

  def contact_us
  end

  def the_team
  end

  def copyrights
  end

  def privacy_disclaimers
  end      


  def tos
    @sitepage = Sitepage.where(:name => 'tos').order_by(:id.desc).first

    set_meta_tags :title => t(:terms_of_service)
    set_meta_tags :description => t(:terms_of_service)
    set_meta_tags :canonical => "/tos"

    set_meta_tags :keywords => t(:terms_of_service) + ', ' + t(:default_page_keywords)

    set_meta_tags :og => {:title    => t(:terms_of_service),
                          :type     => 'article' ,
                          :url      => 'https://' + @site_domain + '/tos/',
    }

  end
  def policy
    @sitepage = Sitepage.where(:name => 'policy').order_by(:id.desc).first

    set_meta_tags :title => t(:privacy_policy)
    set_meta_tags :description => t(:privacy_policy)
    set_meta_tags :canonical => "/policy"

    set_meta_tags :keywords => t(:privacy_policy) + ' ,' + t(:default_page_keywords)

    set_meta_tags :og => {:title    => t(:privacy_policy),
                          :type     => 'article' ,
                          :url      => 'https://' + @site_domain + '/policy/',
    }

  end

  def contact
    url = 'http://helpdesk.gamerz.wiki/hc'
    if Rails.env.com_production?
      url = 'https://gamerzwikicom.zendesk.com/hc/en-us'
    end
    redirect_to url
  end

#  def test
#    render :text => session and return
#    if current_user
#      render :text => 'a' and return
#    else
#      render :text => 'b' and return
#    end
#   # a = Format.create(fields: 'asdfafsa')
##  #  a.save!
# # #  a.fields = 'asdf'
#  ##  a.save!
#   # #Format.with(database: "test").create
##
##    #render :text => request.env['HTTP_HOST']
##    render :text => Mongoid.destructive_fields
#
#  end
  
  def show_env
    render :text => Rails.env
  end

  private
  def updated_sites
    #Site.where(:status => 'listed').order_by(:id.desc)
    #Site.all
    Site.where(:status => :listed).order_by(:id.desc).limit(5)
  end
  def updated_topic_pages
    Topic::Page.where(:status => :public).order_by(:created_at.desc).limit(5)
  end
  def updated_news
    News.where(:status => :published).order_by(:id.desc).limit(5)
  end


  def get_yoyaku_app
    if I18n.locale != :en
      YoyakuApp.distinct(:title)
      @yoyaku_apps = YoyakuApp.order_by(:id.desc).limit(5)
    end
  end


   

end
