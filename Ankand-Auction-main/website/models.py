from django.db import models
from django.utils import timezone
from PIL import Image
from django.core.exceptions import ValidationError

def validate_min_image_dimensions(value):
    """
    Validate that an uploaded image meets minimum height and width requirements.
    """
    min_height = 814  # Define your minimum height here
    min_width = 1920   # Define your minimum width here
    img = Image.open(value)
    width, height = img.size
    if width < min_width or height < min_height:
        raise ValidationError(
            f"The image dimensions must be at least {min_width}x{min_height} pixels."
        )

class Slider(models.Model):
    STATUS_CHOICES = [
        (True, 'Active'),
        (False, 'Deactive'),
    ]
        
    title = models.CharField(max_length=40, null=False , blank=False)
    short_title = models.CharField(max_length=25, null=False , blank=False)
    descriptions = models.CharField(max_length=200, null=False , blank=False)
    button = models.CharField(max_length=20, null=False , blank=False)
    image = models.ImageField(null=True, blank=True, upload_to='sliders/', validators=[validate_min_image_dimensions])
    status = models.BooleanField(default=True, choices=STATUS_CHOICES)
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.title
    

    def save(self):
        super().save()  # saving image first
        if self.image:
            img = Image.open(self.image.path) # Open image using self
            img.thumbnail((1920, 814), Image.Resampling.LANCZOS)
            img.save(self.image.path)  # saving image at the same path
            print(img)
        else:
            pass
