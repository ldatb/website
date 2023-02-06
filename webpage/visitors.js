const getVisitors = async () => {
    const request = await fetch("/api/v1/visitors")
    const data = await request.json();
    const json = JSON.parse(data.body);
    const innerHTML = "<span>Users that have visited this page: " + json["visitors"] + "</span>";
    document.getElementById("visitor-counter").innerHTML += innerHTML
}
getVisitors()
