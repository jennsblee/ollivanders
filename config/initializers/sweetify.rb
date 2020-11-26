require 'sweetify/engine'
require 'sweetify/sweetalert'
require 'sweetify/render'
ActionController::Base.send :include, Sweetify::SweetAlert


Sweetify.sweetalert_library = 'sweetalert'
