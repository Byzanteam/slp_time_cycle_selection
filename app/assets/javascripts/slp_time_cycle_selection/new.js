$(function() {
  let defaultUrl = "/slp_time_cycle_selection/projects"
  if(location.pathname == defaultUrl) {
    getProjects()
  }else{
    getProjectById(location.pathname)
  }
  function getProjects() {
    $.ajax({
      type: "get",
      url: `${defaultUrl}.json`,
      contentType: 'json',
      beforeSend: function() {
        
      },
      success: function(data) {
        if(data.length > 0) {
          $('.new-project').hide()
          $('.project-table').show()
        }else {
          return
        }
        html = '';
        data.forEach(function(obj, index) {
          html += `<tr data-href='${defaultUrl}/${obj.id}'>
                    <td>${obj.name}</td>
                    <td>${obj.delay_minutes}</td>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><button type="button" class="btn btn-outline-danger delete-project-button">删除</button></td>
                  </tr>`
        })
        $('#project-tbody').html(html);
        $('#project-tbody tr').each(function(index, item) {
          $(item).click(function() {
            location.href = item.dataset['href']
          })
          
          $(item).find('.delete-project-button').click(function() {
            var deleteUrl = $(this).parents('tr').data('href');
            $.ajax({
              type: "delete",
              url: `${deleteUrl}.json`,
              contentType: 'json',
              success: function() {
                location.reload()
              }
            })
            return false
          })
        })
        
      }
    })
    
    let createProject = function(options, callback) {
      $.ajax({
        type: "POST",
        url: "/slp_time_cycle_selection/projects",
        data: JSON.stringify(options),
        contentType: "application/json",
        success: function(data) {
          callback(data)
        }
      })
    }
    
    let openModal = function(target) {
      $(target).fadeIn(100);
    }
    
    let closeModal = function(target) {
      $(target).fadeOut(100);    
    }
    
    $('.new-project').click(function() {
      openModal($(this).data('target'))
    });
    
    $('.add-project-button').click(function() {
      openModal($(this).data('target'))
    });
    
    $('.modal-ensure').click(function() {
      var modalId = $(this).parents('.modal').attr('id')
      
      let data = {
        name: $('#formGroupExampleInput').val().trim()
      }
      if(!data.name){
        $('#formGroupExampleInput').next().show()
        return
      }else {
        $('#formGroupExampleInput').next().hide()
      }
      createProject(data, function(data) {
        location.href = `${defaultUrl}/${data.id}`
        closeModal(`#${modalId}`)
      });
      closeModal(`#${modalId}`)
    });
    
    $('.modal-cancel').click(function() {
      var modalId = $(this).parents('.modal').attr('id')
      closeModal(`#${modalId}`)
    })
    
    $('.close').click(function() {
      var modalId = $(this).parents('.modal').attr('id')
      closeModal(`#${modalId}`)
    })
  }
  
  function getProjectById(url) {
    
  }
})
