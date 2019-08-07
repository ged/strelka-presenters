# -*- ruby -*-
# frozen_string_literal: true

require 'strelka' unless defined?( Strelka )


# Toplevel namespace
module Strelka::Presenters

	# Package version
	VERSION = '0.0.1'

	# Version control revision
	REVISION = %q$Revision$


	require 'strelka/app/presenters'
	require 'strelka/httpresponse/presenters'

end # module Strelka::Presenters

