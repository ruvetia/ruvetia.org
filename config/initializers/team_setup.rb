# -*- coding: utf-8 -*-
$team = Team.new
# ruvetia organizers in no particular order
$team << Organizer.new(:senny, 'Yves Senn',
                       social_media: { github: 'http://github.com/senny', twitter: 'https://twitter.com/yves_senn', web: 'http://blog.senny.ch' },
                       gravatar_hash: "3d698e2872c07061a455d9e250861235",
                       bio: "Yves started experimenting with Ruby in late 2007. Since then he worked on medium to large scale Rails applications with a strong focus on automated testing. He is a Rails committer and works on other Open Source projects like spring and queue_classic.")

$team << Organizer.new(:therod, 'Rodrigo Haenggi',
                       social_media: { github: 'http://github.com/therod', twitter: 'https://twitter.com/therod', web: 'http://rodrigohaenggi.com' },
                       gravatar_hash: "961ce8457830cbe5607fd365f134710c",
                       bio: "Rodrigo loves all things japanese - Ruby coming in on place three in his list, right after Anime and Matcha Tea. He has been programming since 2004, but only got really passionate about it after discovering Ruby and its wonderful community. He also loves whiskey, and what could be better than sharing a few drinks with fellow Rubyists? J-pop, maybe?")

$team << Organizer.new(:danielpuglisi, 'Daniel Puglisi',
                       social_media: { github: 'http://github.com/danielpuglisi', twitter: 'https://twitter.com/danielpuglisi', web: 'http://danielpuglisi.com' },
                       gravatar_hash: "34fd3386654f1b625e1d3b8b6c43a217",
                       bio: "Fascinated by Ruby's english like syntax, the Rails Framework and the awesome community behind it, Daniel decided to put Ruby into his design and programming toolbox. Ruvetia is his attempt to make Ruby more fundamental and popular in Switzerland and to spread the love about this beautiful programming language and its extraordinary people behind it.")

$team << Organizer.new(:kschiess, 'Kaspar Schiess',
                       social_media: {
                        bitbucket: 'https://bitbucket.org/kschiess',
                        github: 'http://github.com/kschiess',
                        web: 'http://absurd.li',
                        twitter: 'https://twitter.com/kasparschiess' },
                       gravatar_hash: "ae4df18bf57748120b915d63b7e233d4",
                       bio: "Kaspar has found Ruby in 2003 and since then told everyone who would"+
                          " listen about it. Working hard to promote the language as general purpose"+
                          " programming language, he likes to take a pick at Rails, but only in jest."+
                          " Take a look at his box of gems on github and be delighted by the useful "+
                          " and the obscure.")

$team << Organizer.new(:nerdinand, 'Ferdinand Niedermann',
                       social_media: { github: 'http://github.com/nerdinand', twitter: 'https://twitter.com/nerdinand' },
                       gravatar_hash: "a69ea888ca7c5102e04e59a54d7db420",
                       bio: "Ferdinand got started with Ruby and Rails during his time at the University of Basel. He was soon amazed by the helpful and very active community around Ruby and worked at different companies to apply his Rails knowledge.")
