/*
* 2002-2017 Jetimpex
*
* JX Header Account
*
* NOTICE OF LICENSE
*
* This source file is subject to the General Public License (GPL 2.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/GPL-2.0

* @author     Jetimpex
* @copyright  2002-2017 Jetimpex
* @license    http://opensource.org/licenses/GPL-2.0 General Public License (GPL 2.0)
*/

function in_array(value, array)
{
  for (var i in array)
    if ((array[i] + '') === (value + ''))
      return true;
  return false;
}

jxha = {
  getQueryParameters : function(query) {
    var post = new Array();
    for (var i = 0; i < query.length; i++) {
      post[query[i]['name']] = query[i]['value'];
    }
    return post;
  },
  ajax: function(){
    this.init = function(options){
      this.options = $.extend(this.options, options);
      this.request();

      return this;
    };

    this.options = {
      type: 'POST',
      url: prestashop.urls.base_url,
      cache: false,
      dataType : "json",
      success: function(){},
      error: this.error
    };

    this.request = function(){
      $.ajax(this.options);
    };

    this.error = function(XMLHttpRequest, textStatus, errorThrown){
      var error = "TECHNICAL ERROR: unable to load form.\n\nDetails:\nError thrown: " + XMLHttpRequest + "\n" + 'Text status: ' + textStatus;
      if (!!$.prototype.fancybox) {
        $.fancybox.open([
            {
              type: 'inline',
              autoScale: true,
              minHeight: 30,
              content: "<p class='fancybox-error'>" + error + '</p>'
            }],
          {
            padding: 0
          }
        );
      } else {
        alert(error);
      }
    };
  },
  dropDown: function()
  {
      elementClick = '#header .current';
      elementSlide =  'ul.toogle_content';
      activeClass = 'active';

      $(elementClick).on('click', function(e){
        e.stopPropagation();
        var subUl = $(this).next(elementSlide);
        if(subUl.is(':hidden'))
        {
          subUl.slideDown();
          $(this).addClass(activeClass);
        }
        else
        {
          subUl.slideUp();
          $(this).removeClass(activeClass);
        }
        $(elementClick).not(this).next(elementSlide).slideUp();
        $(elementClick).not(this).removeClass(activeClass);
        e.preventDefault();
      });

      $(elementSlide).on('click', function(e){
        e.stopPropagation();
      });

      $(document).on('click', function(e){
        e.stopPropagation();
        var elementHide = $(elementClick).next(elementSlide);
        $(elementHide).slideUp();
        $(elementClick).removeClass('active');
      });
  },
  sidebar: function(){
    var obj = this;
    this.init = function(options){
      this.options = $.extend(this.options, options);
      this.create();
      this.options.parent.click(function (event) {
        if ($(event.target).closest('.'+obj.options.selector).length === 0 || event.target.classList.contains('jxha-close-btn')) {
          obj.hide();
        }
      });

      return this;
    };
    this.options = {
      selector: 'jxha-sidebar-left',
      parent: $('body'),
      content: JXHEADERACCOUNT_CONTENT
    };
    this.create = function(){
      this.elem = document.createElement('div');
      this.elem.classList.add(this.options.selector);
      this.elem.innerHTML = '<span class="jxha-close-btn">x</span>'+this.options.content;
      this.options.parent.append(this.elem);
      if ($('.header-login-content.is-logged').length && JXHEADERACCOUNT_DISPLAY_STYLE == 'twocolumns') {
        elementTwocolumns();
      }
    };
    this.toggle = function(){
      this.elem.classList.toggle('active');
    };
    this.hide = function(){
      this.elem.classList.remove('active');
    }
  },
  fancy: function(){
    this.init = function(options){
      this.options = $.extend(this.options, options);
      return this;
    };
    this.options = {
      type: 'inline',
      autoScale: true,
      minHeight: 30,
      minWidth: 285,
      padding: 0,
      content: JXHEADERACCOUNT_CONTENT,
      tpl: {
        closeBtn : '<a title="Close" class="fancybox-item jxha-close-btn" href="javascript:;">x</a>'
      },
      helpers: {
        overlay: {
          locked: false
        }
      }
    };
    this.toggle = function(){
      $.fancybox(this.options);
      if (JXHEADERACCOUNT_DISPLAY_STYLE == 'twocolumns') {
        elementTwocolumns();
      }
    };
  },
  init: function(type){
    if (type == 'popup')  {
      this.display = new jxha.fancy();
      this.display.init({});
    } else if(type == 'leftside') {
      this.display = new jxha.sidebar();
      this.display.init();
    } else if (type == 'rightside') {
      this.display = new jxha.sidebar();
      this.display.init({selector: 'jxha-sidebar-right'});
    }
    return this;
  }
};

$(document).ready(function(){
  if (typeof JXHEADERACCOUNT_CONTENT == 'undefined') {
    JXHEADERACCOUNT_CONTENT = '';
  }
  var jxheaderaccount = new jxha.init(JXHEADERACCOUNT_DISPLAY_TYPE);
  var $d = JXHEADERACCOUNT_DISPLAY_TYPE == 'popup' ? $(document) : $('.header-login-content');

  jxha.dropDown();

  $('.header_user_info').on('click', function() {
    if (JXHEADERACCOUNT_DISPLAY_TYPE != 'dropdown') {
      jxheaderaccount.display.toggle();
    }
  });

  $d.on('click', '[name=HeaderSubmitLogin]', function (e) {
    e.preventDefault();
    submitLoginFunction($(this).closest('.login-content'));
  });
  $d.on('click', '.create-account-content button[type=submit]', function(e){
    e.preventDefault();
    submitCreate($(this).closest('.create-account-content'));
  });
  $d.on('click', '.forgot-password-content [type="submit"]', function(e){
    e.preventDefault();
    submitRetrieve($(this).closest('.forgot-password-content'));
  });


  $('.alert.alert-danger').on('click', this, function(e) {
    if (e.offsetX >= 16 && e.offsetX <= 39 && e.offsetY >= 16 && e.offsetY <= 34) {
      $(this).slideUp();
    }
  });

  if (JXHEADERACCOUNT_DISPLAY_STYLE == 'twocolumns') {
    elementTwocolumns();
  }

  if (!parseInt(JXHEADERACCOUNT_USE_REDIRECT)) {
    $d.on('click', '.login-content a.create', function (e) {
      e.preventDefault();
      $(this).closest('.header-login-content').find('.login-content').addClass('hidden');
      $(this).closest('.header-login-content').find('.create-account-content').removeClass('hidden');
      if (typeof bindUniform !=='undefined') {
        bindUniform();
      }
      if (JXHEADERACCOUNT_DISPLAY_TYPE == 'popup') {
        $.fancybox.reposition();
        $.fancybox.update()
      }
    });
    $d.on('click', '.create-account-content a.signin, .forgot-password-content a.signin', function (e) {
      e.preventDefault();
      $(this).closest('.header-login-content').find('.login-content').removeClass('hidden');
      $(this).closest('.header-login-content').find('.create-account-content').addClass('hidden');
      $(this).closest('.header-login-content').find('.forgot-password-content').addClass('hidden');
      if (JXHEADERACCOUNT_DISPLAY_TYPE == 'popup') {
        $.fancybox.reposition();
        $.fancybox.update()
      }
    });
    $d.on('click', '.login-content a.forgot-password', function (e) {
      e.preventDefault();
      $(this).closest('.header-login-content').find('.login-content').addClass('hidden');
      $(this).closest('.header-login-content').find('.forgot-password-content').removeClass('hidden');
      if (JXHEADERACCOUNT_DISPLAY_TYPE == 'popup') {
        $.fancybox.reposition();
        $.fancybox.update()
      }
    });
  }
});

function submitLoginFunction(elem){
  var options = {
    data: {
      fc: 'module',
      module: 'jxheaderaccount',
      controller: 'auth',
      submitLogin: 1,
      ajax: true,
      email: elem.find('[name=email]').val(),
      password: elem.find('[name=password]').val(),
      token: prestashop.token
    },
    success: function(jsonData){
      if (jsonData.hasError) {
        var errors = '';
        for(error in jsonData.errors) {
          if (error != 'indexOf' && error != '' && error != 'back' ) {
            if (jsonData.errors[error] == '') {
              elem.find('[name=' + error + ']').parents('.form-group').removeClass('has-error');
              elem.find('[name=' + error + ']').parents('.form-group').find('.help-block ul').html('');
            } else {
              elem.find('[name=' + error + ']').parents('.form-group').addClass('has-error');
              elem.find('[name=' + error + ']').parents('.form-group').find('.help-block ul').html('<li>' + jsonData.errors[error] + '</li>');
            }
          } else if (error == '') {
            if (jsonData.errors[error] == '') {
              elem.find('.main-help-block ul').html('')
            } else {
              elem.find('.main-help-block ul').html('<li>'+jsonData.errors[error]+'</li>');
            }
          }
        }
      } else {
        document.location.reload();
      }
    }
  };
  var ajax = new jxha.ajax();
  ajax.init(options);
}

function submitCreate(elem){
  var options = {
    data: $.extend({}, jxha.getQueryParameters(elem.find('form').serializeArray()), {
      submitCreate: 1,
      fc: 'module',
      module: 'jxheaderaccount',
      controller: 'auth',
      ajax: true
    }),
    success: function(jsonData)
    {
      if (jsonData.hasError)
      {
        var errors = '';
        for(error in jsonData.errors)
          //IE6 bug fix
          if(error != 'indexOf' && error != '' && error != 'back' ) {
            if (jsonData.errors[error] == '') {
              elem.find('[name=' + error + ']').parents('.form-group').removeClass('has-error');
              elem.find('[name=' + error + ']').parents('.form-group').find('.help-block ul').html('');
            } else {
              elem.find('[name=' + error + ']').parents('.form-group').addClass('has-error');
              elem.find('[name=' + error + ']').parents('.form-group').find('.help-block ul').html('<li>' + jsonData.errors[error] + '</li>');
            }
          } else if (error == '') {
            if (jsonData.errors[error] == '') {
              elem.find('.main-help-block ul').html('')
            } else {
              elem.find('.main-help-block ul').html('<li>' + jsonData.errors[error] + '</li>');
            }
          }
      } else {
        document.location.reload();
      }
    },
    error: function(jsonData)
    {
      elem.find('[name=email]').parents('.form-group').addClass('has-error');
      elem.find('[name=email]').parents('.form-group').find('.help-block ul').html('<li>' + jsonData.responseText + '</li>');
    }
  };
  var ajax = new jxha.ajax();
  ajax.init(options);
}

function submitRetrieve(elem) {
  var options = {
    url: prestashop.urls.base_url + 'modules/jxheaderaccount/controllers/front/password.php',
    data:
    {
      retrievePassword: 1,
      email: elem.find('[name=email]').val()
    },
    success: function(jsonData)
    {
      if (jsonData.hasError)
      {
        var errors = '';
        for(error in jsonData.errors)
          if(error != 'indexOf')
            errors += '<li>' + jsonData.errors[error] + '</li>';
        elem.find('.alert.alert-success').slideUp();
        elem.find('.alert.alert-danger').html('<ol>' + errors + '</ol>').slideDown();
      } else {
        elem.find('.alert.alert-danger').slideUp();
        elem.find('.alert.alert-success').html(jsonData.confirm).slideDown();
      }
    }
  };
  var ajax = new jxha.ajax();
  ajax.init(options);
}

function elementTwocolumns() {
  $('.header-login-content .twocolumns > ul').each(function(){
    $(this).find('.user-data').prependTo($(this).parents('.header-login-content'));
    var total = $(this).children().length;
    var half = Math.ceil(total / 2) - 1;
    $(this).children(':gt('+half+')').detach().wrapAll('<ul></ul>').parent().insertAfter(this);
  });
}
