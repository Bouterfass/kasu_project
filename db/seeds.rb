# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


require 'nokogiri'
require 'rubygems'
require 'open-uri'
require 'faker'

User.delete_all
User.reset_pk_sequence

LibraryItem.delete_all
LibraryItem.reset_pk_sequence

=begin
Manga.delete_all
Manga.reset_pk_sequence


def manga_scraper

    mangas = []

    page = Nokogiri::HTML(URI.open("https://www.manga-news.com/index.php/series/A"))

    arr_title = page.xpath('//*[@id="seriesList"]/tbody/tr/td[1]/div/a/@title').to_a
    titles = []

    arr_title.each do |t|
        titles << t.to_s
    end

    puts "titles = " + titles.length.to_s

    arr_image = page.xpath('.//*[@id="seriesList"]/tbody/tr/td[1]/div/img/@src').to_a

    images = []

    arr_image.each do |i|
        images << i.text
    end

    puts "images = " + images.length.to_s

    arr_authors = page.xpath('//*[@id="seriesList"]/tbody/tr/td[2]').to_a

    authors = []
    arr_authors.each do |aut|
        if aut.text.include? "-" 
            authors << aut.text.split("-")[1].gsub("\n", "").gsub("-","").strip!
        else
            authors << aut.text.gsub("\n", "").strip!
        end
    end

    puts "authors = " + authors.length.to_s

    categories = []
    page.xpath('//*[@id="seriesList"]/tbody/tr/td[5]/text()').each do |c|
        categories << c.to_s.strip!
    end

    puts "categories = " +categories.length.to_s

    volumes = []

    page.xpath('//*[@id="seriesList"]/tbody/tr/td[4]/text()').each do |v|
        volumes << v.text.to_i
    end

    puts "volumes = " +volumes.length.to_s

    links = page.xpath('//*[@id="seriesList"]/tbody/tr/td[1]/div/a[1]/@href').to_a

    descriptions = []

    links.each do |l|
        page_manga = Nokogiri::HTML(URI.open(l))
        descriptions << page_manga.xpath('//*[@id="summary"]/p/text()').text
    end

    puts "descriptions = " + descriptions.length.to_s

    manga_array = []
    i = 0 

    while i < titles.length
        hash = {
            :title => titles[i],
            :author => authors[i],
            :category => categories[i],
            :image_url => images[i],
            :volume => volumes[i],
            :description => descriptions[i]
        }
        manga_array.push(hash)
        i = i + 1
    end
    return manga_array
end

all_mangas = manga_scraper


all_mangas.each do |m|
    Manga.create(
        title: m[:title],
        author: m[:author],
        description: m[:description],
        image_url: m[:image_url]
    )
end
=end

gaetan = User.create(email: "badgaga@test.com", name: "Gaetan", password: "azerty")
stephen = User.create(email: "stephen@test.com", name: "Stephen", password: "azerty")
jules = User.create(email: "jules@test.com", name: "Jules", password: "azerty")
dylan = User.create(email: "dylan@test.com", name: "Dylan", password: "azerty")
youcef = User.create(email: "youcef@test.com", name: "Youcef", password: "azerty")

10.times do 
    LibraryItem.create(user: gaetan, manga: Manga.find(rand(1..458)), state_description: Faker::Lorem.paragraph(sentence_count: 3))
    LibraryItem.create(user: stephen, manga: Manga.find(rand(1..458)), state_description: Faker::Lorem.paragraph(sentence_count: 3))
    LibraryItem.create(user: jules, manga: Manga.find(rand(1..458)), state_description: Faker::Lorem.paragraph(sentence_count: 3))
    LibraryItem.create(user: dylan, manga: Manga.find(rand(1..458)), state_description: Faker::Lorem.paragraph(sentence_count: 3))
    LibraryItem.create(user: youcef, manga: Manga.find(rand(1..458)), state_description: Faker::Lorem.paragraph(sentence_count: 3))
end
