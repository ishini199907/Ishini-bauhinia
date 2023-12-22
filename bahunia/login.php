<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
    <!-- <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script> -->
    <script src="https://apis.google.com/js/platform.js" async defer></script>
    <style>
        #uni_modal .modal-content > .modal-footer,
        #uni_modal .modal-content > .modal-header {
            display: none;
        }
    </style>
</head>
<body>

<div class="container-fluid">
    <div class="row">
        <h3 class="float-right">
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </h3>
        <div class="col-lg-12">
            <h3 class="text-center">Login</h3>
            <hr>
            <form action="" id="login-form">
                <div class="form-group">
                    <label for="" class="control-label">Email</label>
                    <input type="email" class="form-control form" name="email" required>
                </div>
                <div class="form-group">
                    <label for="" class="control-label">Password</label>
                    <input type="password" class="form-control form" name="password" required>
                </div>
                <div class="form-group d-flex justify-content-between">
                <a href="javascript:void()" id="create_account">Create Account</a>
                    <button class="btn btn-primary btn-flat" onclick="performSignIn('normal')">Login</button>
                    <!-- <button class="btn btn-primary btn-flat" onclick="googleSignIn()">Google Sign</button> -->
                    <script src="https://accounts.google.com/gsi/client" async></script>
                </div>
                <div>
                <div id="g_id_onload"
                    data-client_id="YOUR_GOOGLE_CLIENT_ID"
                    data-login_uri="https://your.domain/your_login_endpoint"
                    data-auto_prompt="false">
                </div>
                <div class="g_id_signin"
                    data-type="standard"
                    data-size="large"
                    data-theme="outline"
                    data-text="sign_in_with"
                    data-shape="rectangular"
                    data-logo_alignment="left">
                </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script>

    gapi.client.init({
  clientId: "399223327543-ui26ovsvlrgm5evt8ca3ocjpk27kelc9.apps.googleusercontent.com",
  apiKey: "AIzaSyDkSS5GBe7JfXda82gKVgbZAI3DcWoPM0U",
  discoveryDocs: ["https://apis.google.com/js/api:client.json"]
});

    function performSignIn(type) {
        start_loader();

        // Get login form data
        var formData = $('#login-form').serialize();

        // Perform sign-in based on the type (normal or Google)
        $.ajax({
            url: type === 'normal' ? _base_url_ + "classes/Login.php?f=login_user" : _base_url_ + "classes/Login.php?f=login_user_google",
            method: "POST",
            data: formData,
            dataType: "json",
            error: function (err) {
                console.log(err);
                alert_toast("An error occurred", "error");
                end_loader();
            },
            success: function (resp) {
                if (typeof resp == 'object' && resp.status == 'success') {
                    alert_toast("Login Successfully", 'success');
                    setTimeout(function () {
                        location.reload();
                    }, 2000);
                } else if (!!resp.msg) {
                    var _err_el = $('<div>')
                    _err_el.addClass("alert alert-danger err-msg").text(resp.msg)
                    $('#login-form').prepend(_err_el)
                    end_loader();
                } else {
                    console.log(resp);
                    alert_toast("An error occurred", "error");
                    end_loader();
                }
            }
        });
    }
    function googleSignIn() {
  var auth2 = gapi.auth2.getAuthInstance();
  auth2.signIn().then(function (googleUser) {
    var profile = googleUser.getBasicProfile();
    var email = profile.getEmail();
    var name = profile.getName();
    var idToken = googleUser.getAuthResponse().id_token;

    // Send user information to server for validation
    $.ajax({
      url: _base_url_ + "classes/Login.php?f=login_user_google",
      method: "POST",
      data: { email: email, name: name, id_token: idToken },
      dataType: "json",
      error: function (err) {
        console.log(err);
        alert_toast("An error occurred", "error");
        end_loader();
      },
      success: function (resp) {
        if (typeof resp == 'object' && resp.status == 'success') {
          alert_toast("Login Successfully", 'success');
          setTimeout(function () {
            location.reload();
          }, 2000);
        } else if (!!resp.msg) {
          var _err_el = $('<div>')
          _err_el.addClass("alert alert-danger err-msg").text(resp.msg)
          $('#login-form').prepend(_err_el)
          end_loader();
        } else {
          console.log(resp);
          alert_toast("An error occurred", "error");
          end_loader();
        }
      }
    });
  });
}




</script>
<script>
    $(function(){
        $('#create_account').click(function(){
            uni_modal("","registration.php","mid-large")
        })
        $('#login-form').submit(function(e){
            e.preventDefault();
            start_loader()
            if($('.err-msg').length > 0)
                $('.err-msg').remove();
            $.ajax({
                url:_base_url_+"classes/Login.php?f=login_user",
                method:"POST",
                data:$(this).serialize(),
                dataType:"json",
                error:err=>{
                    console.log(err)
                    alert_toast("an error occured",'error')
                    end_loader()
                },
                success:function(resp){
                    if(typeof resp == 'object' && resp.status == 'success'){
                        alert_toast("Login Successfully",'success')
                        setTimeout(function(){
                            location.reload()
                        },2000)
                    }else if(!!resp.msg){
                        var _err_el = $('<div>')
                            _err_el.addClass("alert alert-danger err-msg").text(resp.msg)
                        $('#login-form').prepend(_err_el)
                        end_loader()
                        
                    }else{
                        console.log(resp)
                        alert_toast("an error occured",'error')
                        end_loader()
                    }
                }
            })
        })
    })
</script>

</body>
</html>
