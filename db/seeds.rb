# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


heroes = [
    {
        name: "Gamora",
        age: 29,
        enjoys: "Listening to 70's jams while cruising through the galaxy",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQay-ueFvf3PjCBaFyJJUTkDNFHXwo6lFRVmA&usqp=CAU"
    },
    {
        name: "Deadpool",
        age: 36,
        enjoys: "kicking butt and fueling my unhealthy love of Chimichangas",
        image: "https://images.unsplash.com/photo-1501432377862-3d0432b87a14?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=774&q=80"
    },
    {
        name: "Bucky Barnes",
        age: 106,
        enjoys: "Minding my business and applying oil to my vibranium arm",
        image: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRBN3CQ3zrVEzksXs5_izGWAjYqdvuEUXE5qg&usqp=CAU"

    },
    {
        name: "Peter Parker",
        age: 30,
        enjoys: "stalking my ex's insta bc she doesn't remember that we were ever together",
        image: "https://images.unsplash.com/photo-1636569061713-0212bd19e3e5?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTR8fHNwaWRlcm1hbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=800&q=60"
    }
]

heroes.each do |attributes|
    Hero.create(attributes)
    p "Creating hero #{attributes}"
end
