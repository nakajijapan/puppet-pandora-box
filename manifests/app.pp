import 'base.pp'
import 'nginx.pp'
import 'mysql.pp'

class app {

  include base
  include nginx
  include mysql
  class {
    'rbenv':
      defaultversion => '2.0.0-p353'
  }

}

include app

