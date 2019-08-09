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
        $('.new-project').hide()
        $('.project-table').show()
        html = '';
        data.forEach(function(obj, index) {
          html += `<tr data-href='${defaultUrl}/${obj.id}'>
                    <td>${obj.name}</td>
                    <td>${obj.delay_minutes}</td>
                    <td></td>
                    <td></td>
                    <td></td>
                  </tr>`
        })
        $('#project-tbody').html(html);
        $('#project-tbody tr').each(function(index, item) {
          $(item).click(function() {
            location.href = item.dataset['href']
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
    
    let openModal = function() {
      $('#exampleModal').fadeIn(100);
    }
    
    let closeModal = function() {
      $('#exampleModal').fadeOut(100);    
    }
    
    $('.new-project').click(openModal);
    
    $('.add-project-button').click(openModal);
    
    $('.modal-ensure').click(function() {
      let data = {
        name: $('#formGroupExampleInput').val().trim()
      }
      createProject(data, function(data) {
        location.href = `${defaultUrl}/${data.id}`
        closeModal()
      });
      closeModal()
    });
    
    $('.modal-cancel').click(closeModal)
    
    $('.close').click(closeModal)
  }
  
  function getProjectById(url) {
    $.ajax({
      type: "get",
      url: `${url}.json`,
      contentType: 'json',
      success: function(data) {
        
      }
    })
    
    $('#close-project').click(function() {
      location.href = defaultUrl
    })
    
  }
})
