const getVisitors = async () => {
    const request = await fetch('https://d1lk9q35flvxh1.cloudfront.net/v1/visitors', {
        method: "GET",
        headers: {
            "Access-Control-Allow-Origin": "*",
            "Access-Control-Allow-Methods": "GET",
            "Access-Control-Allow-Headers": "Content-Type",
        }
    });
    const response = await request.json();
    const json = JSON.parse(response.body);
    const innerHTML = "<span>Users that have visited this page: " + json["visitors"] + "</span>";
    document.getElementById("visitor-counter").innerHTML += innerHTML
    console.log(json["visitors"])
}
getVisitors()
