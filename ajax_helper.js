
// Base function for issuing an AJAX request.
//     In general you should use one of the helpers defined
//     Lower instead of this.

// method:
//   "GET" => Used when you want to retrieve data from the server
//   "POST" => Used when you want to updated data on the server
//   "PUT" => Used when you want to insert new data on the server
//   "DELETE" => Used when you want to delete data on the server
// url: the URL of the request
// on_success: callback function for if the request succeeds
// on_failure: callback function for if the request fails
// data: string of data to send to the server in addition to the url
function AJAX(method, url, on_success, on_failure, data) {

    // Create an HTTP request that we're
    //     going to send to the server
    let request = new XMLHttpRequest()


    // Create a handler for the ready state change event
    // This is called every time the status of our request
    // changes (For instance unsent, loading, or complete)
    function handle_status_change() {

        // Only do stuff if we're being notified
        //     that the request is complete (4)
        if (request.readyState == 4) {
            if (request.status == 200) {
                // If the request status is "OK" (200)
                //     call the on_success callback
                //     with the response text
                on_success(request.responseText)
            } else {
                // If the request status is not OK,
                //     call on the on_failure callback
                //     with the status code and error message
                on_failure(request.status)
            }
        }
    }

    // Assign our handler to the request
    request.onreadystatechange = handle_status_change

    // Open the request (set the specifics for the request)
    request.open(method, url, true)

    // Send the request off to the server
    request.send(data)
}

// Take no action when called
function NO_OP() {}


// Helpers that have callbacks for both success and failure of the request
function GET(url, on_success, on_failure, data) { AJAX("GET", on_success, on_failure, data) }
function POST(url, on_success, on_failure, data) { AJAX("POST", on_success, on_failure, data) }
function PUT(url, on_success, on_failure, data) { AJAX("PUT", on_success, on_failure, data) }
function DELETE(url, on_success, on_failure, data) { AJAX("DELETE", on_success, on_failure, data) }


// Helpers that never get notified if succeeded or failed
function GET_silent(url, data) { AJAX("GET", NO_OP, NO_OP, data) }
function POST_silent(url, data) { AJAX("POST", NO_OP, NO_OP, data) }
function PUT_silent(url, data) { AJAX("PUT", NO_OP, NO_OP, data) }
function DELETE_silent(url, data) { AJAX("DELETE", NO_OP, NO_OP, data) }


// Helpers that only get notified on success
function GET_success(url, on_success, data) { AJAX("GET", on_success, NO_OP, data) }
function POST_success(url, on_success, data) { AJAX("POST", on_success, NO_OP, data) }
function PUT_success(url, on_success, data) { AJAX("PUT", on_success, NO_OP, data) }
function DELETE_success(url, on_success, data) { AJAX("DELETE", on_success, NO_OP, data) }


// Helpers that only get notified on failure
function GET_failure(url, on_failure, data) { AJAX("GET", NO_OP, on_failure, data) }
function POST_failure(url, on_failure, data) { AJAX("POST", NO_OP, on_failure, data) }
function PUT_failure(url, on_failure, data) { AJAX("PUT", NO_OP, on_failure, data) }
function DELETE_failure(url, on_failure, data) { AJAX("DELETE", NO_OP, on_failure, data) }
