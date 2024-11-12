<?php
function filterRequests($requestname)
{
    return htmlspecialchars(strip_tags($_POST[$requestname]));
}
