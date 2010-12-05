atom_feed do |feed|
  feed.title "Mark Holton software blog posts"
  
  latest_post = @posts.sort_by(&:updated_at).last 
  feed.updated( latest_post && latest_post.updated_at )
  
  @posts.each do |post|
    feed.entry(post) do |entry| 
      entry.title "Post: #{post.title}"
      entry.content :type => 'xhtml' do |xhtml|
        xhtml.table do 
          xhtml.tr do
            xhtml.th 'Title' 
            xhtml.th 'content'
          end 
          xhtml.tr do 
            xhtml.td post.title 
            xhtml.td post.content.html_safe 
          end 
          xhtml.p "check out RedGrind.com"
        end
      end
    end
 end 
end