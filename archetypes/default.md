---
title: "{{ replace .Name "-" " " | title }}"
date: {{ .Date }}
publishDate: {{ .Date }}
lastmod: {{ .Date }}
draft: true
tags: 
categories: [a]
author: {{ .Site.Params.author }}
ogImage: "/images/ogImage/{{ .Name }}.png"
---

