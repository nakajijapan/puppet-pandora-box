import 'base.pp'
import 'nginx.pp'
import 'mysql.pp'
import 'iptables.pp'

class app {

  include base
  include nginx
  include mysql
  include iptables
  class {
    'rbenv':
      defaultversion => '2.1.0'
  }

}

include app

