+++
title = "Cloud Résumé Challenge: My (AWS)some journey"
description = ""
type = ["posts","post"]
tags = [
    "cloud",
    "resume",
    "aws",
    "development",
]
date = "2023-02-06"
categories = [
    "Development",
]
[ author ]
  name = "Lucas de Ataides"
+++

I've always been a fan of pipelines, automation and all this awesome
stuff, but I had no idea there was a name for it. DevOps. It really
changed my mind, and my career goals. I was constantly doing courses
and looking for fun projects to do, but no one was satisfying me
enough, they were either too simple or didn't fit my goal. That was
until I found out about the [Cloud Résumé Challenge](https://cloudresumechallenge.dev/docs/the-challenge/).
It is an amazing resource to learn and practice not only DevOps, by
Cloud platforms (which itself are a part of DevOps). It is a very
popular challenge, but I had no idea it existed, so I tried to give it
a go!

## The Challenge

I decided to try the challenge on AWS, since most of the jobs I could
find require some knowledge of it. Maybe I can try Azure or GCP in the
future for other projects, but AWS's free tier helped a lot with this
decision.

## Certification

I don't have the AWS Cloud Practitioner certification, but this was an
amazing way to study for this certification, and I am for sure giving
it a try after this.

## HTML + CSS

'm not a fan of web development, so I simply went to [CodePen](https://codepen.io/)
and searched some cool websites that I could use as a template. For me
this worked fine since I have no intentions on doing anything front-end
related, my focus is on DevOps, but, if you want to become a full-stack
(even though I don't consider DevOps a part of full-stack, some people
do) developer, this is a essential step for you.

*UPDATE (2023-10-08): I've updated a lot on this website. Started
using [Hugo](https://gohugo.io/) to generate a better looking website,
and change a lot on how the backend and IaaC of this project works as
well. You can find everything in the [GitHub repo](https://github.com/ldatb/website).*

**What I learned:**

- Basic HTML and CSS
- *UPDATE (2023-10-08): Static website generation*

## HTTPS

This was also really simple, as AWS CloudFront does all the heavy lifting
for you, all I had to do was point my S3 Bucket to a CloudFront
distribution and that's it! Obviously later on I would have to create a
DNS certificate, but for now, simply hosting it on CloudFront would
work. As I would discover later on the process, this would be one of
the most important steps in this challenge.

**What I learned:**

- AWS CloudFront Distributions
- Terraform started getting more and more difficult. Took me a couple
of days to make the IaaC for this work.

## DNS

I got super proud of this (and also super frustrated), because my
awesome resume could now be accessible via my own domain! This turned
out to be trickier than I expected, because I had to create custom DNS
certificates, learn how domains work, CNAME, A registers, etc., etc.
It was a difficult step, but the most awesome one.

**What I learned:**

- AWS Route 53
- DNS Domains and Certificates

## Database

*UPDATE (2023-10-08): The new version of this website does not uses
this anymore, but I'll leave this step here as it was part of the
challenge.*

This was a tricky part, because I was trying to figure out how to
deploy a MariaDB database with Terraform, and configure the table I
needed. I searched a lot for answers, but turns out I was
over-complicating things, and I could simply use AWS DynamoDB for it.
At first, I was a bit skeptical of using a No-SQL database for a such
a simple thing (I would only need 1 row of data), but the hardest part
was just understanding how DynamoDB works. With that, I also had to
learn about VPCs, since I don't want anyone having direct access to my
database.

**What I learned:**

- AWS DynamoDB
- AWS VPCs
- NoSQL databases

## API

*UPDATE (2023-10-08): Same as above. The new version of this website
does not uses this anymore, but I'll leave this step here as it was
part of the challenge.*

There's no point in having a database that no one can access, so I had
to make an API to call for the data I needed. The problem was, since I
was hosting my website on an S3 Bucket, I could not create the API with
the website, I had to make use of serverless functions (AWS Lambda).
That (as everything in this challenge) was quite tricky, but it gets
really simple when you get the hang of it, it's quite intuitive.
I simply had to make one call to the database requesting the number of
visitors, and that was it!

The next thing I had to do was connect this lambda function to an AWS
API Gateway (which has a quite confusing dashboard) and I could access
it anywhere! I stumbled upon some issue on that step, and had to learn
about permissions and roles on AWS, since my lambda function was
(at first) not being executed by the API.

**What I learned:**

- AWS Lambda
- Serverless functions
- REST API
- AWS API Gateway
- AWS roles and permissions

## Visitors Counter

*UPDATE (2023-10-08): Same as above. The new version of this website
does not uses this anymore, but I'll leave this step here as it was
part of the challenge.*

Now, with the API ready, I could make my website display a number of
visitors! But it wasn't that simple. Again, as I was hosting it on an
S3 bucket, I had to do some shenanigans to make an API call that did
not go over the internet (since S3 Buckets are a simple block storage
and don't have any computational power).

My solution was adding the API Gateway to the same CloudFront
distribution as the S3 Bucket, that way, I could access the API
endpoint "locally" (like it was in a folder of the S3 Bucket). The
JavaScript part of it was super easy, simply make a call to that API
and use it.

**What I learned:**

- How to combine AWS API Gateway with static websites hosted on AWS S3
Buckets
- Making API calls with JavaScript

## Infrastructure as a code (IaC)
*UPDATE (2023-10-08): Since I'm now using [Hugo](https://gohugo.io/)
to generate this website, the Terraform project is not required anymore,
as Hugo has a built-in [deployment tool](https://gohugo.io/hosting-and-deployment/hugo-deploy/).
Nonetheless I'll leave the files in the [GitHub repo](https://github.com/ldatb/website)*

It might be worth saying that, for the entire challenge, I was doing
stuff with IaaC. Turns out that's not the best way of learning both
Terraform and AWS at the same time, and if I were to do this again, I
would first do everything manually, so I can learn it better, and then
turn it into a IaC project. Nonetheless, it was very fun seeing the
Terraform building everything.

**What I learned:**

- Using Terraform to build AWS projects
- IaaC

## CI/CD

This was by far the easiest part. As I was hosting my code on GitHub,
I could use GitHub Actions to make a simple CI/CD pipeline so that
every time that I update either the API or the website, it
automatically updates everything, and I never (hopefully) have to do
anything ever again!

What I learned:

- CI/CD
- GitHub Actions

## The End!

And with this blog post, I finish the challenge, and officially enter
the Champions club!

This was a super fun and amazing project that helped me learn SO MUCH
about AWS and DevOps. I hope doing more stuff like that in the future.

You can check the final product [here](https://ldatb.com/)
