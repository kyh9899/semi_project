

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Two Sections in a Div</title>
<style>
    .parent-div {
        display: flex;
    }
    
    .left-section {
        flex: 20%;
        background-color: lightblue;
    }
    
    .right-section {
        flex: 80%;
        background-color: lightyellow;
    }
</style>
</head>
<body>
    <div class="parent-div">
        <section class="left-section">
            <!-- Left section content -->
            <h2>Left Section</h2>
            <p>This is the left section content.</p>
        </section>
        <section class="right-section">
            <!-- Right section content -->
            <h2>Right Section</h2>
            <p>This is the right section content.</p>
        </section>
    </div>
</body>
</html>
