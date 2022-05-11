◊; This template provides the structure of pages that perform "grouping" functions: series and type roots.
◊; For example, the "law" series and "blog" type.
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8"/>
  <title>◊(hash-ref metas 'title)</title>
  ◊; Because I deploy this site in a sub-directory (rather than a domain root) I
  ◊; have to use relative paths instead of absolute ones. Defining path-prefix
  ◊; is just my way of coping with this.
  ◊(define path-prefix (if (string-contains (symbol->string here) "/") "../" ""))
  ◊(define source-file (select-from-metas 'here-path metas))
  ◊(define pollen-source-listing
      (regexp-replace #px"(.*)\\/(.+).html" (symbol->string here) "\\2.pollen.html"))
  <link rel="stylesheet" href="/css/tufte.css"/>
  <link rel="stylesheet" href="/css/joel.css"/>
  <link rel="alternate" type="application/atom+xml" title="Atom feed" href="◊|path-prefix|feed.xml" />
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <style type="text/css">
   img { mix-blend-mode: multiply; }
  </style>
</head>
<body><article>
    <h1>◊(hash-ref metas 'title)</h1>
    ◊when/splice[(and (select-from-metas 'author metas) (select-from-metas 'doc-publish-date metas))]{
        <h3>◊(hash-ref metas 'author) &middot; ◊(pubdate->abbr-english (hash-ref metas 'doc-publish-date))</h3>
    }
    <nav><ul>
        ◊when/splice[(and (previous here) (not (eq? (parent here) (previous here))))]{
            <li><a href="◊|path-prefix|◊|(previous here)|">&larr; Previous</a></li>
        }
        ◊when/splice[(not (eq? here 'index.html))]{
            <li><a href="◊|path-prefix|index.html">&uarr; Home</a></li>
        }
        ◊when/splice[(and (next here) (member (next here) (siblings here)))]{
            <li><a href="◊|path-prefix|◊|(next here)|">Next &rarr;</a></li>
        }
    </ul></nav>
     ◊when/splice[(select-from-metas 'summary metas)]{
        <p style="margin-bottom:0;">◊(hash-ref metas 'summary)</p>
    }
	◊(map ->html (select-from-doc 'body here))

    ◊(->html (list-group-posts (children 'all.html) here (select-from-metas 'group-kind metas) #t path-prefix))
</article>
    <footer><hr>
    <p>I'm Faiz. I’m currently a Computing major in the College of Creative Studies at UC Santa Barbara. You can find me on <a href="https://github.com/ProbablyFaiz">GitHub</a>, <a href="https://www.linkedin.com/in/faiz-surani-74a510126/">LinkedIn</a>, or <a href="mailto:faiz@faizsurani.com">by email</a>.</p>
    </footer>
</body>
</html>
