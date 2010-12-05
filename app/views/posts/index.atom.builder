atom_feed do |feed|
  feed.title "Mark Holton software blog posts"
  
  latest_post = @posts.sort_by(&:updated_at).last 
  feed.updated( latest_post && latest_post.updated_at )
  
  @posts.each do |post|
    feed.entry(post) do |entry| 
      entry.title "#{post.title}"
      entry.content :type => 'xhtml' do |xhtml|
        xhtml.table do 
          xhtml.tr do
            xhtml.th 'content'
          end 
          xhtml.tr do 
            xhtml.td Sanitize.clean(post.content.html_safe)
            #post.content.html_safe 
          end 
          xhtml.p "post by Mark Holton"
        end
      end
    end
 end 
end