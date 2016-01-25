module.exports =
  config:
    light:
      type: 'boolean'
      default: false
      description: 'Optimized for light themes'
    tabPaneIcon:
      type: 'boolean'
      default: true
      description: 'Icons on tabs'

  activate: (state) ->
    atom.config.onDidChange 'fun_files.light', ({newValue, oldValue}) =>
      @light newValue
    @light atom.config.get 'fun_files.light'

    atom.config.onDidChange 'fun_files.tabPaneIcon', ({newValue, oldValue}) =>
      @tabPaneIcon newValue
    @tabPaneIcon atom.config.get 'fun_files.tabPaneIcon'
    # console.log 'activate'

  deactivate: ->
    # console.log 'deactivate'

  serialize: ->
    # console.log 'serialize'

  light: (enable) ->
    body = document.querySelector 'body'
    if enable
      body.className = "#{body.className} fun_files-light"
    else
      body.className = body.className.replace /\sfun_files-light/, ''


  tabPaneIcon: (enable) ->
    body = document.querySelector 'body'
    className = body.className
    if enable
      body.className = "#{className} fun_files-tab-pane-icon"
    else
      body.className = className.replace /\sfun_files-tab-pane-icon/, ''
