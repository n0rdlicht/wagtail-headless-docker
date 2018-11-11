# Generated by Django 2.1 on 2018-11-11 05:06

from django.db import migrations
import pages.streamfields
import wagtail.core.blocks
import wagtail.core.fields
import wagtail.images.blocks


class Migration(migrations.Migration):

    dependencies = [
        ('pages', '0005_auto_20181111_0459'),
    ]

    operations = [
        migrations.AlterField(
            model_name='homepage',
            name='content',
            field=wagtail.core.fields.StreamField([('richtext', pages.streamfields.RichTextBlock()), ('image', pages.streamfields.ImageBlock()), ('nested_streams', wagtail.core.blocks.StructBlock([('card', wagtail.core.blocks.ListBlock(wagtail.core.blocks.StructBlock([('title', wagtail.core.blocks.CharBlock(required=True)), ('content', wagtail.core.blocks.RichTextBlock(features=['bold', 'italic', 'ol', 'ul'], required=False)), ('image', wagtail.images.blocks.ImageChooserBlock(required=True)), ('page', wagtail.core.blocks.PageChooserBlock(required=True))])))])), ('carousel', wagtail.core.blocks.StreamBlock([('image', wagtail.images.blocks.ImageChooserBlock()), ('quotation', wagtail.core.blocks.StructBlock([('text', wagtail.core.blocks.TextBlock()), ('author', wagtail.core.blocks.CharBlock())]))]))], null=True),
        ),
    ]
