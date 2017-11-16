## URI - uniform resource identifier
- a URL (uniform resource locator) is pretty much the same thing.
- a URL is a URI for a resource on the network

#### Parts of a URI, using https://en.wikipedia.org/wiki/Fish
- scheme: https
- hostname: en.wikipedia.org
- path: /wiki/Fish

###### Scheme
- tells client how to go about accessing the resource
- 'file' uris tell the client to access local filesystem
- https uses an encrypted connection
- some others
  1. mailto: email
  2. data: used to put a piece of hardcoded data directly into a webpage, eg. a small image
  3. magnet - used often in p2p file sharing - identifies files by content
        and cryptographic hash value rather than location

###### Hostname
- tells client which server to connect to
- hostname can ONLY appear after a URI scheme that supports it (http, etc.)
- not every URI has a hostname, eg. mailto has just an email address

###### Path
- identifies a particular resource on a server, such as pages, videos, or APIs
- tells the server which resource the client is looking for
- DOESN'T ALWAYS EQUATE TO FILENAMES
  - for instance, a google search path = `/search?q=penguins`
- when you write a URI *without* a path, the browser fills in the default path,
which is written with a single slash at the end
  - eg. `http://udacity.com` -> `http://udacity.com/`
  - this is called the **root**

#### Relative URI references
`<a href='penguin.png'>penguin.png</a>`
- this is an example of a **relative** URI reference
- it's *relative* to its context - typically the page it's on

#### Other URI parts

###### # = Fragment
`https://en.wikipendia.org/wiki/Oxygen`
vs
`https://en.wikipendia.org/wiki/Oxygen#Discovery`
- both of these links will fetch the *same page* from the server
- the second displays the page scrolled to the discovery section
- the part after the # is called the fragment
- the browser **doesn't** even send fragments to the server
- instead, it lets a link point to a specifically named part of a resource
   - in HTML, in links to `id` elements

###### ? = Query
`https://www.google.com/search?q=fish`
- `?q=fish` is the query
- it does get sent to the server

## Hostnames and ports

#### IP addresses
- an IP address can also be a hostname
  - eg., `http://216.58.194.174/` goes to google.com
- IP addresses are used to tell computers apart
- when connecting to a web server, the client needs to translate the hostname
into an IP address
- the client's operating system's network config uses the DNS (Domain Name Service) to do so
- the DNS is a set of servers maintained by ISPs and other network users to look up IP addresses

- in terminal, you can use the `host` program to look up hostnames in DNS
  - `$host wwww.google.com`

- `nslookup` is similar, but also shows the IP address of the DNS server that's giving
the answer

###### IPV4
- older
- examples:
  - `127.0.0.1`
  - `216.58.194.164`

###### IPV6
- newer
- examples:
  - `2607:f8b0:4005:804::2004`
