movies = {
  momo: 4,
  thriller: 3,
  cast_away: 3,
  magnolia: 4
}

puts "Please enter 'add', 'update', 'display' or 'delete':"
choice=gets.chomp

case choice
  	when "add"
  		puts "Please enter a movie title:"
  		title = gets.chomp.downcase
  		if movies[title.to_sym]==nil
        puts "Please enter a rating for this movie (0-4):"
        rating=gets.chomp
        movies[title.to_sym]= rating.to_i
        puts "The movies has been added to the list."
      else
        puts "The movie already exists! Nothing will be added..."
      end
		when "update"
  		puts "Please enter a movie title:"
  		title = gets.chomp.downcase
  		if movies[title.to_sym]!=nil
        puts "Please enter a rating for this movie (0-4):"
        rating=gets.chomp
        movies[title.to_sym]= rating.to_i
        puts "The movies has been added to the list."
      else
        puts "The movie doesn't exist in the list."
      end
  	when "display"
  		movies.each do |movie, rating|
        puts "#{movie}: #{rating}"
      end
  	when "delete"
  		puts "Please enter a movie title:"
  		title = gets.chomp.downcase
  		if movies[title.to_sym]!=nil
        movies.delete(title.to_sym)
        puts "The movies has been deleted from the list."
      else
        puts "The movie doesn't exist in the list."
      end
		else
  		puts "Error!"
end

print movies
