class app {

  include base
  include nginx
  include mysql
  include rbenv
  #class {
  #  'rbenv':
  #    defaultversion => '2.0.0-p247'
  #}

}

include app

