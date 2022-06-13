provider "aws" {

 region = "ap-south-1"
}
 

resource "aws_ebs_volume" "data-vol" {

 availability_zone =  "ap-south-1a"

 size = 10

 tags = {

        Name = "data-volume"

 }


}

resource "aws_volume_attachment" "TestEC2-vol" {

 device_name = "/dev/sdc"

 volume_id = "${aws_ebs_volume.data-vol.id}"

 instance_id = "${aws_instance.testEC2.id}"

}

