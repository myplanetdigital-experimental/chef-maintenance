#
# Cookbook Name:: maintenance
# Recipe:: hardy
#
# Author:: Patrick Connolly <patrick@myplanetdigital.com>
#
# Copyright 2011, Myplanet Digital
#
# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License along
# with this program; if not, write to the Free Software Foundation, Inc.,
# 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
#

# hardy ships with *really* old ca-certs
# update them so some https requests don't fail with curl
%w{ curl ca-certificates }.each do |pkg|
  package pkg
end

bash "Updating cacerts" do
    user "root"
    group "root"
    code <<-EOH
    curl http://curl.haxx.se/ca/cacert.pem -o /etc/ssl/certs/ca-certificates.crt
    EOH
end
