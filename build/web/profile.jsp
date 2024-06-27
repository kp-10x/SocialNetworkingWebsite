
<%@page import="java.sql.ResultSet"%>
<%@page import="in.sp.dbqueries.DbQueries"%>
<%
    String profile_pic = (String) session.getAttribute("session_profilepic");
    String email = (String) session.getAttribute("session_email");
    String name1 = (String) session.getAttribute("session_name");
%>
<html>
    <head>
        <title>My Profile</title>

        <link rel="stylesheet" type="text/css" href="css/style.css" />
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" />

        <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.2/font/bootstrap-icons.css" />

        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" ></script>
        <script src="https://code.jquery.com/jquery-3.6.4.min.js" integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" crossorigin="anonymous"></script>
        
        <script>
            $(document).ready(function(){
                $(".alert").delay(2000).slideUp(600, function() {
                    $(this).alert('close');
                });
            });
        </script>
        
    </head>
    <body>
        <%
    String success_message = (String) request.getAttribute("success_message");
    if(success_message != null)
    {
        %>
        <div class="alert alert-success alert-dismissible fade show" style="text-align: center">
            <%= success_message %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <%
    }
    
    String error_message = (String) request.getAttribute("error_message");
    if(error_message != null)
    {
        %>
        <div class="alert alert-danger alert-dismissible fade show" style="text-align: center">
            <%= error_message %>
            <button type="button" class="btn-close" data-bs-dismiss="alert"></button>
        </div>
        <%
    }
    %>
    
    
        <!-- header div starts -->
        <div class="container-fluid bg-primary header_div">
            <div class="container">
                <div class="row">
                    <div class="col-4">
                        <a href="home.jsp" class="navbar-brand text-light">Social Network</a>
                    </div>
                    <div class="col-3">

                    </div>
                    <div class="col-5">
                        <a href="profile.jsp" class="header_profile_link">
                            <img src="profile-pics/<%=profile_pic%>" alt="" class="img-fluid dp_img_style" />
                            <span class="text-light"> <%= session.getAttribute("session_name") %> </span>
                        </a>
                        &nbsp;&nbsp;
                        <button type="button" class="btn btn-info dropdown-toggle btn-sm" data-bs-toggle="dropdown"> More </button>
                        <ul class="dropdown-menu">
                            <li> <a href="home.jsp" class="dropdown-item"> Home </a> </li>
                            <li> <a href="profile.jsp" class="dropdown-item bg-secondary text-light"> My Profile </a> </li>
                            <li> <a href="edit-my-profile.jsp" class="dropdown-item"> Edit My profile </a> </li>
                            <li> <a href="logout" class="dropdown-item"> Logout </a> </li>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <!-- header div close -->

        <div class="container-fluid">
            <div class="container">
                <div class="row" style="padding: 40px">
                    <!-- Sidebar div starts -->
                    <div class="col-3 shadow-sm p-3 mb-5 bg-body rounded">
                        <nav id="sidebarMenu" class="collapse d-lg-block sidebar collapse bg-white">
                            <div class="position-sticky">
                                <div class="list-group list-group-flush mx-3 mt-4">
                                    <a href="home.jsp" class="list-group-item list-group-item-action py-2 ripple">
                                        <i class="bi bi-newspaper"></i> <span>News Feed</span>
                                    </a>
                                    <a href="#" class="list-group-item list-group-item-action py-2 ripple">
                                        <i class="bi bi-wechat"></i> <span>Messanger</span>
                                    </a>
                                    <a href="#" class="list-group-item list-group-item-action py-2 ripple">
                                        <i class="bi bi-people"></i> <span>Friend List</span>
                                    </a>
                                    <a href="#" class="list-group-item list-group-item-action py-2 ripple">
                                        <i class="bi bi-stopwatch"></i> <span>Watch</span>
                                    </a>
                                    <a href="#" class="list-group-item list-group-item-action py-2 ripple">
                                        <i class="bi bi-shop"></i> <span>Marketplace</span>
                                    </a>
                                    <a href="#" class="list-group-item list-group-item-action py-2 ripple">
                                        <i class="bi bi-calendar-event"></i> <span>Events</span>
                                    </a>
                                    <a href="#" class="list-group-item list-group-item-action py-2 ripple">
                                        <i class="bi bi-file-earmark-break"></i> <span>Page</span>
                                    </a>
                                    <a href="#" class="list-group-item list-group-item-action py-2 ripple">
                                        <i class="bi bi-collection"></i> <span>Group</span>
                                    </a>
                                </div>
                            </div>
                        </nav>
                    </div>
                    <!-- Sidebar div ends -->

                    <div class="col-9">
                        <div class="row">
                            <div class="col-3">
                                <img src="profile-pics/<%=profile_pic%>" alt="" style="max-width: 80%; border-radius: 10px; box-shadow: 0px 0px 5px #dddcdc; padding: 5px;" />
                            </div>
                            <div class="col-9">
                                <a href="edit-my-profile.jsp"><i class="bi bi-pencil-fill" style="float: right"></i></a>
                                <h4 class="text-primary"> <%= session.getAttribute("session_name")%> </h4> <br/>
                                <b> Email :</b> <%= session.getAttribute("session_email")%> <br/>
                                <b> Gender :</b> <%= session.getAttribute("session_gender")%> <br/>
                                <b> City :</b> <%= session.getAttribute("session_city")%> <br/>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12 p-3">
                                <div class="shadow p-4 mb-5 bg-body rounded">
                                    <h5> <i class="bi bi-postcard"></i> Post Status </h5> <br/>
                                    <form action="UploadStatus" method="post" enctype="multipart/form-data">
                                        <textarea name="status_text" class="status_textarea_design" placeholder="What are your thoughts"></textarea> <br/> <br/>
                                        <input type="file" name="status_img" class="form-control" style="width: 50%" />
                                        <input type="submit" value="Post" class="btn btn-primary post_btn"/>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-12">

                                <%
                                    try {
                                        ResultSet rs = DbQueries.getStatusOfUser(email);
                                        while (rs.next()) {
                                            String status_text = rs.getString("status_text");
                                            String status_img = rs.getString("status_image");
                                            String date1 = rs.getString("date1");
                                            String time1 = rs.getString("time1");

                                            if (!status_text.equals("") && !status_img.equals("")) {
                                %>

                                <div class="shadow p-4 mb-5 bg-body rounded">
                                    <div class="status_heading">
                                        <img src="profile-pics/<%=profile_pic%>" alt="" class="dp_img_style" /> &nbsp;&nbsp; <%=name1%>  <span class="small text-secondary" style="float: right"> <%=date1%> [<%=time1%>] </span>
                                    </div>
                                    <div class="row shadow-sm p-3 mb-5 bg-body rounded">
                                        <%=status_text%> <br/> <br/>
                                        <div>
                                            <img src="status-images/<%=status_img%>" alt="" style="max-width: 80%" />
                                        </div>
                                    </div>
                                    <div class="status_heading">
                                        <form action="DeleteStatus" method="post" >
                                            <input type="hidden" value="<%=date1%>" name="date1" />
                                            <input type="hidden" value="<%=time1%>" name="time1" />
                                            <button type="submit" class="btn btn-primary">
                                                <i class="bi bi-trash3-fill"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>

                                <%
                                } else if (status_text.equals("")) {
                                %>

                                <div class="shadow p-4 mb-5 bg-body rounded">
                                    <div class="status_heading">
                                        <img src="profile-pics/<%=profile_pic%>" alt="" class="dp_img_style" /> &nbsp;&nbsp; <%=name1%>  <span class="small text-secondary" style="float: right"> <%=date1%> [<%=time1%>] </span>
                                    </div>
                                    <div class="row shadow-sm p-3 mb-5 bg-body rounded">
                                        <img src="status-images/<%=status_img%>" alt="" style="max-width: 80%" />
                                    </div>
                                    <div class="status_heading">
                                        <form action="DeleteStatus" method="post" >
                                            <input type="hidden" value="<%=date1%>" name="date1" />
                                            <input type="hidden" value="<%=time1%>" name="time1" />
                                            <button type="submit" class="btn btn-primary">
                                                <i class="bi bi-trash3-fill"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>

                                <%
                                } else if (status_img.equals("")) {
                                %>

                                <div class="shadow p-4 mb-5 bg-body rounded">
                                    <div class="status_heading">
                                        <img src="profile-pics/<%=profile_pic%>" alt="" class="dp_img_style" /> &nbsp;&nbsp; <%=name1%>  <span class="small text-secondary" style="float: right"> <%=date1%> [<%=time1%>] </span>
                                    </div>
                                    <div class="row shadow-sm p-3 mb-5 bg-body rounded">
                                        <%=status_text%>
                                    </div>
                                    <div class="status_heading">
                                        <form action="DeleteStatus" method="post" >
                                            <input type="hidden" value="<%=date1%>" name="date1" />
                                            <input type="hidden" value="<%=time1%>" name="time1" />
                                            <button type="submit" class="btn btn-primary">
                                                <i class="bi bi-trash3-fill"></i>
                                            </button>
                                        </form>
                                    </div>
                                </div>

                                <%
                                            }
                                        }
                                    } catch (Exception e) {
                                        e.printStackTrace();
                                    }
                                %>

                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </body>
</html>
