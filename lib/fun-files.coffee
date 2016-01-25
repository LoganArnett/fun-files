module.exports =
  config:
    light:
      type: 'boolean'
      default: false
      description: 'Icons Suited for light themes'
    tabPaneIcon:
      type: 'boolean'
      default: true
      description: 'Icons on tabs'

  activate: (state) ->
    atom.config.onDidChange 'Fun files.light', ({newValue, oldValue}) =>
      @light newValue
    @light atom.config.get 'Fun files.light'

    atom.config.onDidChange 'Fun files.tabPaneIcon', ({newValue, oldValue}) =>
      @tabPaneIcon newValue
    @tabPaneIcon atom.config.get 'Fun files.tabPaneIcon'
    # console.log 'activate'

  deactivate: ->
    # console.log 'deactivate'

  serialize: ->
    # console.log 'serialize'

  light: (enable) ->
    body = document.querySelector 'body'
    if enable
      body.className = "#{body.className} fun-files-light"
    else
      body.className = body.className.replace /\sfun-files-light/, ''


  tabPaneIcon: (enable) ->
    body = document.querySelector 'body'
    className = body.className
    if enable
      body.className = "#{className} fun-files-tab-pane-icon"
    else
      body.className = className.replace /\sfun-files-tab-pane-icon/, ''
