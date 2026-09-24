<nav class="sidebar">
   <div class="sidebar-header">
      <img src="assets/images/logo.png" style="height: 75px;padding-top: 10px;">
      <div class="sidebar-toggler not-active">
         <span></span>
         <span></span>
         <span></span>
      </div>
   </div>
   <div class="sidebar-body">
      <ul class="nav">
         <li class="nav-item nav-category">Main</li>
         <li class="nav-item">
            <a href="dashboard.php" class="nav-link">
            <i class="link-icon" data-feather="box"></i>
            <span class="link-title">Dashboard</span>
            </a>
         </li>
         <li class="nav-item nav-category">web apps</li>
         <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#emails" role="button" aria-expanded="false" aria-controls="emails">
            <i class="link-icon" data-feather="users"></i>
            <span class="link-title">Clients</span>
            <i class="link-arrow" data-feather="chevron-down"></i>
            </a>
            <div class="collapse" id="emails">
               <ul class="nav sub-menu">
                  <li class="nav-item">
                     <a href="adds.php" class="nav-link">Add client</a>
                  </li>
                  <li class="nav-item">
                     <a href="client_data.php" class="nav-link">View Client</a>
                  </li>
               </ul>
            </div>
         </li>
         <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#emails1" role="button" aria-expanded="false" aria-controls="emails">
            <i class="link-icon" data-feather="trending-up"></i>
            <span class="link-title">Case Stage</span>
            <i class="link-arrow" data-feather="chevron-down"></i>
            </a>
            <div class="collapse" id="emails1">
               <ul class="nav sub-menu">
                  <li class="nav-item">
                     <a href="addcase_stage.php" class="nav-link">Add Case stage</a>
                  </li>
                  <li class="nav-item">
                     <a href="viewcase_stage.php" class="nav-link">View Case Stage</a>
                  </li>
               </ul>
            </div>
         </li>
         <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#emails2" role="button" aria-expanded="false" aria-controls="emails">
            <i class="link-icon" data-feather="check-square"></i>
            <span class="link-title">Legel Acts</span>
            <i class="link-arrow" data-feather="chevron-down"></i>
            </a>
            <div class="collapse" id="emails2">
               <ul class="nav sub-menu">
                  <li class="nav-item">
                     <a href="add_act.php" class="nav-link">Add Acts</a>
                  </li>
                  <li class="nav-item">
                     <a href="view_act.php" class="nav-link">View Acts</a>
                  </li>
               </ul>
            </div>
         </li>
         <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#emails3" role="button" aria-expanded="false" aria-controls="emails">
            <i class="link-icon" data-feather="user-plus"></i>
            <span class="link-title">Case Registration</span>
            <i class="link-arrow" data-feather="chevron-down"></i>
            </a>
            <div class="collapse" id="emails3">
               <ul class="nav sub-menu">
                  <li class="nav-item">
                     <a href="register_case.php" class="nav-link">Register Case</a>
                  </li>
                  <li class="nav-item">
                     <a href="view_case.php" class="nav-link">View Case</a>
                  </li>
               </ul>
            </div>
         </li>
         <li class="nav-item">
            <a class="nav-link" data-bs-toggle="collapse" href="#emails4" role="button" aria-expanded="false" aria-controls="emails">
            <i class="link-icon" data-feather="info"></i>
            <span class="link-title">Reports</span>
            <i class="link-arrow" data-feather="chevron-down"></i>
            </a>
            <div class="collapse" id="emails4">
               <ul class="nav sub-menu">
                  <li class="nav-item">
                     <a href="clients.php" class="nav-link">clients</a>
                  </li>
                  <li class="nav-item">
                     <a href="case_report.php" class="nav-link">Case</a>
                  </li>
               </ul>
            </div>
         </li>

      </ul>
   </div>
</nav>