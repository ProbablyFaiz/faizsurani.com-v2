#lang pollen

◊(define-meta title            "Oprimal Evacuation Routes")
◊(define-meta author           "Faiz Surani")
◊(define-meta summary          "A Vehicle Routing Problem simulation using OpenStreetMaps data to find optimal evacuation routes for Glacier National Park in case of emergency.")
◊(define-meta series           "series/data-science.html")
◊(define-meta post-type        "projects.html")
◊(define-meta pdf-url          "assets/gnp-evacuation-routes.pdf")

◊p{I produced this paper in February 2019 in response to ◊hyperlink["https://m3challenge.siam.org/practice-problems/song-fire-and-glaciers"]{this problem statement} to prepare for a mathematical modeling competition and familiarize myself with combinatorial optimization problems. As shown in the above screenshot, I used publicly available trail data to create an optimally short (minimax) evacuation plan for the entirety of the park using multiple evacuation teams from the different ranger stations in the park.}