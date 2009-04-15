# $Id$
# 
# Copyright (c) 2009 The MacPorts Project
# All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are
# met:
# 
# 1. Redistributions of source code must retain the above copyright
#    notice, this list of conditions and the following disclaimer.
# 2. Redistributions in binary form must reproduce the above copyright
#    notice, this list of conditions and the following disclaimer in the
#    documentation and/or other materials provided with the distribution.
# 3. Neither the name of The MacPorts Project nor the names of its
#    contributors may be used to endorse or promote products derived from
#    this software without specific prior written permission.
# 
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
# LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
# A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT
# OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
# SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT
# LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
# DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
# THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
# (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
# OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
# 
# Usage:
# 
#   PortGroup               php5pecl 1.0
#   php5pecl.setup          pecl_package version
# 
# where pecl_package is the name of the package (e.g. APC), and version
# is its version. This automatically sets up the standard environment for
# building PECL modules.


proc php5pecl.setup {package version} {
    global destroot prefix worksrcpath
    
    name                    php5-${package}
    version                 ${version}
    categories              php
    homepage                http://pecl.php.net/package/${package}/
    master_sites            http://pecl.php.net/get/
    distname                ${package}-${version}
    extract.suffix          .tgz
    
    depends_lib             path:bin/phpize:php5
    
    pre-configure {
        system "cd ${worksrcpath} && ${prefix}/bin/phpize"
    }
    
    destroot.destdir        INSTALL_ROOT=${destroot}
}
