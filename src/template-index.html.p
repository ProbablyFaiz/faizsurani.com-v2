<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>◊(hash-ref metas 'title)</title>
  <link rel="stylesheet" href="/css/tufte.css"/>
  <link rel="stylesheet" href="/css/joel.css"/>
  <link rel="alternate" type="application/atom+xml" title="Atom feed" href="feed.xml" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style type="text/css">
   img { mix-blend-mode: multiply; }
  </style>
</head>
<body>
    <article>
	<h1>◊(hash-ref metas 'title)</h1>
◊;    <h2>◊(hash-ref metas 'author)</h2>

    ◊; Insert the content from the page (index.html.pm in this case).
    ◊(map ->html (select-from-doc 'body here))

    <p>
        <a href="about.html">About Me</a> 
        &middot; <a href="/assets/resume.pdf">Resume</a> 
        &middot; <a href="https://github.com/ProbablyFaiz">GitHub</a>
        &middot; <a href="https://www.linkedin.com/in/faiz-surani-74a510126/">LinkedIn</a>
        ◊; &middot; <a href="mailto:faiz@faizsurani.com">Email</a>
        ◊; &middot; <a href="feed.xml"><span class="caps">RSS</span> Feed</a>
    </p>

    ◊(define (list-groupings group-type)
        (define (make-grouping-link group add-delimiter)
            `(span 
                (a [[href ,(symbol->string group)]] ,(select-from-metas 'title group))
                ,(if add-delimiter
                    `(span " " middot " ")
                    ""
                 )
             )
        )

        (define (but-last xs) (reverse (cdr (reverse xs))))
        (define (non-last-grouping-link grouping) (make-grouping-link grouping #t))
        (define groupings (children group-type))

        `(span 
            ,@(map non-last-grouping-link (but-last groupings))
            ,(make-grouping-link (car (reverse groupings)) #f)
        )
    )

    ◊; <p class="smallcaps" style="margin-bottom: 1rem; padding-top: 1rem;">
    ◊;     find by category: ◊(->html (list-groupings 'series.html))
    ◊; </p>

    ◊(define (list-type-posts type) 
        `(div
            (h2 (a [[href ,(symbol->string type)]] ,(select-from-metas 'title type)))
            ,(list-group-posts (children 'all.html) type 'post-type #f "")
         )
    )

    ◊(->html (map list-type-posts (children 'types.html)))
    </article>
</body>
</html>
