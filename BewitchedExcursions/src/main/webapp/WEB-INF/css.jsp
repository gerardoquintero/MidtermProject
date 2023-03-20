
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD"
	crossorigin="anonymous">
<style>
.card img {
  width: 250px;
  height: 250px;
  object-fit: contain;
}

.card {
  width: 300px;
  height: 400px;
  border: 1px solid #ccc;
  margin: 10px;
  padding: 10px;
  box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.3);
  display: inline-block;
  overflow: hidden;
   max-width: 500px;
  max-height: 1000px;
  
}

body {
	font-size: 14px;
	line-height: 1.5;
	color: #333;
	background-color: #f5f5f5;
}

h1, h2, h3, h4, h5, h6 {
	font-weight: bold;
	margin-top: 0;
	margin-bottom: 20px;
}

a {
	color: #337ab7;
	text-decoration: none;
}

a:hover {
	color: #23527c;
	text-decoration: underline;
}


</style>

<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="home.do">Recipe Book</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarNav" aria-controls="navbarNav"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNav">
			<ul class="navbar-nav">
				
				<li class="nav-item"><a class="nav-link" href="recipesform.do">Add
						a recipe</a></li>
				<li class="nav-item"><a class="nav-link" href="updateform.do">Update
						a recipe</a></li>
				<li class="nav-item"><a class="nav-link" href="deleteform.do">Delete
						a recipe</a></li>
				<form class="d-flex" method="GET" action="keyword.do">
					<input class="form-control me-2" type="text" name="keyword"
						placeholder="Search by keyword">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>


			</ul>
		</div>
	</div>
</nav>
