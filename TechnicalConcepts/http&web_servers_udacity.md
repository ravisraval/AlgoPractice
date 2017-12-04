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


## IP addresses
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

  ###### Localhost
  - IPV4 for localhost is `127.0.0.1`
  - IPV6 for localhost is `::1`

  - when you run a demo server, it'll say it's listening on `0.0.0.0`
  - this is special code meaning every IPV4 address on this computer
  - includes localhost and your computer's regular ip address

## Ports
- client usually figures out the port number from the URI scheme
  - eg., HTTP implies port 80
  - HTTPS implies port 443
- all internet traffic is split up into **packets**
- each packet has the IP address of its sender and receiver
- nearly all packets, except for low-level ones like `ping`, also have
  the **port number** for the sender and receiver
- IP addresses distinguish computers; port number distinguish **programs** on those computers

- a server *listening* on a port tells its OS to receive connections at that port
- thus, the OS knows to forward client requests on that port to the server
- OSs only allow root accounts to listen to ports below 1024

## HTTP GET requests
`127.0.0.1 - - [03/Oct/2016 15:45:50] "GET /readme.png HTTP/1.1" 200 -`
- the part after the date is the request
- GET is the **method**, or **HTTP verb** being used
- `/readme.png` is the **path** of the resource being requested.
  - doesn't send the whole URI, just the path
- `HTTP/1.1` is the **protocol** of the request.
  - there have been changes to the way HTTP works
  - this is how clients tell servers which version of HTTP they're speaking

## HTTP Responses

    `ncat google.com 80`
      `GET / HTTP/1.1`
      `Host: google.com`

- the first line of an HTTP response is the **status / status line**
- next come the **headers**
- finally, the **response body**

#### Status line
- 1xx - informational. the request is in progress or there's another step to take
- 2xx - success - the server is sending the requested data
- 3xx - redirection - server tells client a different URI
  - the headers will usually contain a **location** header with the updated URI
  - different codes distinguish between permanent or temporary redirects
- 4xx - client error - the server can't understand or won't allow the request
- 5xx - server error

#### Headers
- each line starts with a keyword, eg. `location` or `Content-type`
- **cookies** are implemented with headers, using `Set-cookie`
  - the browser will return cookie data with a `Cookie` header
- `Content-type` indicates the kind of data the server is sending
  - eg. PNG image file will come with Content-type `image/png`
- `Content-Length` is often sent - tell how long, in bytes, the response body will be
  - the client can refuse the connection to send another request
  - browsers use this so they can fetch many pieces of data (eg, lots of images)
  without having to reconnect to the server

#### Response Body
- the headers end with a blank line. everything after is the response body
