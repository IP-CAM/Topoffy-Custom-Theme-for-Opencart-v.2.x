<?php echo $header; ?>
<div class="<?php echo $container ?: 'container-fluid'; ?>">
  <div class="row"><?php echo $column_left; ?>
    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>
    <div id="content" class="<?php echo $class; ?> space-30 bg-filled"><?php echo $content_top; ?>
      <ul class="breadcrumb">
        <?php $i = 1; foreach ($breadcrumbs as $breadcrumb) { ?>
          <?php if ($i == count($breadcrumbs)) { ?>
          <li><?php echo $breadcrumb['text']; ?></li>
          <?php } else { ?>
          <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
          <?php } ?>
        <?php $i++; } ?>
      </ul>
      <h1><?php echo $heading_title; ?></h1>
      <?php if ($recurrings) { ?>
      <div class="table-responsive">
        <table class="table table-bordered table-hover">
          <thead>
            <tr>
              <td class="text-right"><?php echo $column_order_recurring_id; ?></td>
              <td class="text-left"><?php echo $column_product; ?></td>
              <td class="text-left"><?php echo $column_status; ?></td>
              <td class="text-left"><?php echo $column_date_added; ?></td>
              <td class="text-right"></td>
            </tr>
          </thead>
          <tbody>
            <?php foreach ($recurrings as $recurring) { ?>
            <tr>
              <td class="text-right">#<?php echo $recurring['order_recurring_id']; ?></td>
              <td class="text-left"><?php echo $recurring['product']; ?></td>
              <td class="text-left"><?php echo $recurring['status']; ?></td>
              <td class="text-left"><?php echo $recurring['date_added']; ?></td>
              <td class="text-right"><a href="<?php echo $recurring['view']; ?>" data-toggle="tooltip" title="<?php echo $button_view; ?>" class="btn btn-empty"><i class="material-icons">visibility</i></a></td>
            </tr>
            <?php } ?>
          </tbody>
        </table>
      </div>
      <div class="text-right"><?php echo $pagination; ?></div>
      <?php } else { ?>
      <p><?php echo $text_empty; ?></p>
      <?php } ?>
      <div class="buttons clearfix">
        <div class="pull-right"><a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a></div>
      </div>
      <?php echo $content_bottom; ?></div>
    <?php echo $column_right; ?></div>
</div>
<?php echo $footer; ?>
