class app {

  include base
  include nginx
  include mysql
  class {
    'rbenv':
      defaultversion => '2.0.0-p247'
  }

}

include app

