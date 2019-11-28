require 'page-object'

class SearchPage
    
    # using page-objects gem project
    include PageObject #This includes the initialize constructor, so do not add another!
  
    #define locators
    text_field(:search_field, :id => 'q')
    button(:submit, :name => 'btnK')

    #add our methods
    def search_for_item (search_term)
        self.search_field = search_term
        self.submit
    end

  end

  