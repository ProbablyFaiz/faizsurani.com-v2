<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>◊(hash-ref metas 'title)</title>
  <link rel="stylesheet" href="css/tufte.css"/>
  <link rel="stylesheet" href="css/joel.css"/>
  <link rel="alternate" type="application/atom+xml" title="Atom feed" href="feed.xml" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style type="text/css">
   img { mix-blend-mode: multiply; }
  </style>
</head>
<body>
    <article>
	<h1>◊(hash-ref metas 'title)</h1>
    <h2>◊(hash-ref metas 'author)</h2>

    ◊; Insert the content from the page (index.html.pm in this case)
    ◊(map ->html (select-from-doc 'body here))

    <p>
        <a href="about.html">About Me</a> 
        &middot; <a href="resume.pdf">Resume</a> 
        ◊; &middot; <a href="feed.xml"><span class="caps">RSS</span> Feed</a>
    </p>

    ◊(define (list-groupings group-type)
        (define (make-grouping-link group add-delimiter)
            `(span [[class "smallcaps"]] 
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

    <p>
        Find by category: ◊(->html (list-groupings 'series.html))
    </p>

    ◊(define (list-posts-of-type s)
        (define (make-li post)
            `(li (a [[href ,(symbol->string post)]] (span [[class "smallcaps"]] ,(select-from-metas 'title post)))
                ,(if (select-from-metas 'doc-publish-date post)
                    (span " - " (pubdate->abbr-english (select-from-metas 'doc-publish-date post)))
                    ""
                 )
                ,(if (select-from-metas 'pdf-url post)
                    `(span [[class "smallcaps"]] "  (" (a [[href ,(select-from-metas 'pdf-url post)]] "PDF") ")")
                    ""
                 )
             )
        )

        (define (is-child-page? p)
            (equal? (symbol->string s) (select-from-metas 'post-type p))
        )

        `(section (h2 , (select-from-metas 'title s))
                  (ul ,@(map make-li (filter is-child-page? (children 'all.html))))
        )
    )

    ◊(->html (map list-posts-of-type (children 'types.html)))
    </article>
</body>
</html>
