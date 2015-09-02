<?php if ($reviews) { ?>

<?php foreach ($reviews as $review) { ?>
<div class="review-list">
  <div class="author"><span class="contrast_font"><?php echo $review['author']; ?></span>, <?php echo $review['date_added']; ?></div>
  
  
  <span class="rating r<?php echo $review['rating']; ?>"><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i><i class="fa fa-star"></i></span>
  
  
  <div class="text"><?php echo $review['text']; ?></div>
  <!-- Review reply start -->
  <?php if ($review['reply'] && $review['reply'] != '&lt;p&gt;&lt;br&gt;&lt;/p&gt;') { ?><br><div style="padding-left: 20px; color: #21C0F0; font-weight: bold;"><?php echo $text_reply; ?></div><div style="padding-left: 20px;"><?php echo html_entity_decode($review['reply']); ?></div><?php } ?>
  <!-- Review reply end -->
</div>
<?php } ?>
<div class="text-right"><?php echo $pagination; ?></div>
<?php } else { ?>
<p><?php echo $text_no_reviews; ?></p>
<?php } ?>