# Strelka-Presenters

home
: http://deveiate.org/projects/strelka-presenters

code
: http://bitbucket.org/ged/strelka-presenters

github
: https://github.com/ged/strelka-presenters

docs
: http://deveiate.org/code/strelka-presenters


## Description

Strelka-Presenters is a plugin for the Strelka web framework that adds
integration with the [Yaks hypermedia library][Yaks].

### Usage

Load the plugin in your Strelka app, passing the Yaks configuration block:

    class Example::App < Strelka::App
  
      plugin :presenters do
        default_format :hal
        rel_template 'https://example.com/rels/{rel}'
        mapper_namespace Example::Service::Presenters
      end

      plugin :router
      
      get 'users' do |request|
        users = Example::Users.all
        response = request.response
        response.present( users )
        return response
      end

    end

Your app will automatically load the `negotiation` plugin, and responses will have a #present method that will map objects passed to it using Yaks into an acceptable response format using HTTP content negotiation.

See the documentation for [Yaks][] for more info.

## Prerequisites

* Ruby


## Installation

    $ gem install strelka-presenters


## Contributing

You can check out the current development source with Mercurial via its
[project page][project]. Or if you prefer Git, via
[its Github mirror][gitmirror].

After checking out the source, run:

    $ rake newb

This task will install any missing dependencies, run the tests/specs,
and generate the API documentation.


## License

Copyright (c) 2019, Michael Granger
All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

* Redistributions of source code must retain the above copyright notice,
  this list of conditions and the following disclaimer.

* Redistributions in binary form must reproduce the above copyright notice,
  this list of conditions and the following disclaimer in the documentation
  and/or other materials provided with the distribution.

* Neither the name of the author/s, nor the names of the project's
  contributors may be used to endorse or promote products derived from this
  software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE
FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.



[project]: http://bitbucket.org/ged/strelka-presenters
[Yaks]: https://github.com/plexus/yaks/blob/master/yaks/README.md
[gitmirror]: https://github.com/ged/strelka-presenters

