<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<!--  <meta name="description" content="A schedule management with jQuery.">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
 	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="/studyplus/resources/dist/jquery.schedule.css">
    <link rel="stylesheet" href="/studyplus/resources/dist/jquery.schedule-demo.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script src="/studyplus/resources/dist/jquery.schedule.js"></script> -->

<link rel="stylesheet"
	href="/studyplus/resources/dist/jquery.schedule.css">
<link rel="stylesheet"
	href="/studyplus/resources/dist/jquery.schedule-demo.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/smoothness/jquery-ui.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.1/jquery.js"></script>

<script
	src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script>
		var $i = jQuery.noConflict(); 
	</script>
<!-- <script src="/studyplus/resources/dist/jquery.schedule.js"></script> -->
<script>
		;(function ($i, window, document, undefined) {
		  'use strict';

		  // Defaults options
		  var defaults = {
		      mode: 'edit', // read
		      hour: 24, // 12
		      periodDuration: 30, // 15/30/60
		      data: [],
		      periodOptions: true,
		      periodColors: [],
		      periodTitle: '',
		      periodBackgroundColor: 'rgba(82, 155, 255, 0.5)',
		      periodBorderColor: '#2a3cff',
		      periodTextColor: '#000',
		      periodRemoveButton: 'Remove',
		      periodDuplicateButton: 'Duplicate',
		      periodTitlePlaceholder: 'Title',
		      days: [
		        'Monday',
		        'Tuesday',
		        'Wednesday',
		        'Thursday',
		        'Friday',
		        'Saturday',
		        'Sunday'
		      ],
		      onInit: function () {},
		      onAddPeriod: function () {},
		      onRemovePeriod: function () {},
		      onDuplicatePeriod: function () {},
		      onClickPeriod: function () {}
		    },
		    pluginName = 'jqs';

		  // Plugin constructor
		  function Plugin(element, options) {
		    this.element = element;
		    this.settings = $i.extend({}, defaults, options);
		    this.periodOptions = {
		      title: this.settings.periodTitle,
		      backgroundColor: this.settings.periodBackgroundColor,
		      borderColor: this.settings.periodBorderColor,
		      textColor: this.settings.periodTextColor
		    };
		    this.init();
		  }

		  $i.extend(Plugin.prototype, {
		    /**
		     * Plugin instance seed
		     */
		    seed: Math.random().toString(36).substr(2),

		    /**
		     * Period addition counter
		     */
		    counter: 0,

		    /**
		     * Period interval multiplier
		     */
		    periodInterval: 0,

		    /**
		     * Period max height
		     */
		    periodHeight: 0,

		    /**
		     * Period position max step
		     */
		    periodPosition: 0,

		    /**
		     * Generate id for a period
		     * @returns {string}
		     */
		    uniqId: function () {
		      this.counter++;

		      return pluginName + '_' + this.seed + '_' + this.counter;
		    },

		    /**
		     * Plugin init
		     */
		    init: function () {
		      var $ithis = this;

		      // colors validation
		      if (this.settings.periodColors.length > 0) {
		        $i.each(this.settings.periodColors, function (index, color) {
		          if (!$i.inArray(color) || color.length !== 3) {
		            throw new Error('Invalid periodColors');
		          }
		        });
		      }

		      // duration validation
		      if ($i.inArray(this.settings.periodDuration, [15, 30, 60]) === -1) {
		        throw new Error('Invalid periodDuration');
		      }

		      this.periodInterval = 60 / this.settings.periodDuration;
		      this.periodHeight = 24 * this.periodInterval;
		      this.periodPosition = 40 / this.periodInterval;

		      $i(this.element).addClass('jqs').addClass('jqs-mode-' + this.settings.mode);

		      // Init events
		      if (this.settings.mode === 'edit') {
		        var position = 0;
		        var helper = false;

		        $i(this.element).on('mousedown', '.jqs-day', function (event) {
		          var offset = event.pageY - $i(this).offset().top;
		          position = Math.floor(offset / $ithis.periodPosition);

		          if (!$i(event.target).hasClass('jqs-period') && $i(event.target).parents('.jqs-period').length === 0) {
		            var time = '';
		            if ($ithis.settings.periodDuration !== 15) {
		              time = $ithis.periodInit(position, position + 1);
		            }

		            helper = $i('<div>').addClass('jqs-period-helper').css({
		              'height': $ithis.periodPosition,
		              'top': position * $ithis.periodPosition
		            }).append('<div class="jqs-period-helper-time">' + time + '</div>');

		            $i(this).append(helper);
		          }
		        });

		        $i(this.element).on('mousemove', '.jqs-day', function (event) {
		          if (helper) {
		            var offset = event.pageY - $i(this).offset().top;
		            var height = Math.round(offset / $ithis.periodPosition) - position;
		            if (height <= 0) {
		              height = 1;
		            }

		            helper.css({
		              'height': height * $ithis.periodPosition
		            });

		            if (height >= 1) {
		              $i('.jqs-period-helper-time', helper).text($ithis.periodInit(position, position + height));
		            } else {
		              $i('.jqs-period-helper-time', helper).text('');
		            }
		          }
		        });

		        $i(this.element).on('mouseup', '.jqs-day', function (event) {
		          if (!$i(event.target).hasClass('jqs-period') && $i(event.target).parents('.jqs-period').length === 0) {
		            var offset = event.pageY - $i(this).offset().top;
		            var height = Math.round(offset / $ithis.periodPosition) - position;
		            if (height <= 0) {
		              height = 1;
		            }

		            $ithis.add($i(this), position, height);
		          }

		          position = 0;
		          if (helper) {
		            helper.remove();
		            helper = false;
		          }
		        });

		        $i(this.element).on('mouseenter', '.jqs-day', function () {
		          var index = $i(this).parents('td').index();
		          $i('.jqs-grid-day', $ithis.element).eq(index).addClass('jqs-grid-day-buttons');
		        });

		        $i(this.element).on('mouseleave', '.jqs-day', function () {
		          var index = $i(this).parents('td').index();
		          $i('.jqs-grid-day', $ithis.element).eq(index).removeClass('jqs-grid-day-buttons');
		        });

		        $i(this.element).on('click', '.jqs-period-remove', function () {
		          var period = $i(this).parents('.jqs-period');
		          $ithis.remove(period);
		        });

		        $i(this.element).on('click', '.jqs-period-duplicate', function () {
		          var period = $i(this).parents('.jqs-period');
		          $ithis.duplicate(period);
		        });

		        $i(this.element).on('click', '.jqs-day-remove', function () {
		          var index = $i(this).parents('.jqs-grid-day').index();
		          var parent = $i('.jqs-day', $ithis.element).eq(index);
		          $ithis.removeAll(parent);
		        });

		        $i(this.element).on('click', '.jqs-day-duplicate', function () {
		          var index = $i(this).parents('.jqs-grid-day').index();
		          var parent = $i('.jqs-day', $ithis.element).eq(index);
		          $ithis.duplicateAll(parent);
		        });
		      }

		      this.create();
		      this.generate();

		      this.settings.onInit.call(this, this.element);
		    },

		    /**
		     * Generate schedule structure
		     */
		    create: function () {

		      $i('<table class="jqs-table"><tr></tr></table>').appendTo($i(this.element));

		      for (var i = 0; i < 7; i++) {
		        $i('<td><div class="jqs-day"></div></td>').
		          appendTo($i('.jqs-table tr', this.element));
		      }

		      $i('<div class="jqs-grid"><div class="jqs-grid-head"></div></div>').appendTo($i(this.element));

		      for (var j = 0; j < 25; j++) {
		        $i('<div class="jqs-grid-line"><div class="jqs-grid-hour">' + this.formatHour(j) + '</div></div>').
		          appendTo($i('.jqs-grid', this.element));
		      }

		      var dayRemove = '';
		      var dayDuplicate = '';
		      if (this.settings.mode === 'edit') {
		        dayRemove = '<div class="jqs-day-remove" title="' + this.settings.periodRemoveButton + '"></div>';
		        dayDuplicate = '<div class="jqs-day-duplicate" title="' + this.settings.periodDuplicateButton +
		          '"></div>';
		      }

		      for (var k = 0; k < 7; k++) {
		        $i('<div class="jqs-grid-day">' + this.settings.days[k] + dayRemove + dayDuplicate + '</div>').
		          appendTo($i('.jqs-grid-head', this.element));
		      }
		    },

		    /**
		     * Generate periods from data option
		     */
		    generate: function () {
		      if (this.settings.data.length > 0) {
		        var $ithis = this;

		        $i.each(this.settings.data, function (index, data) {
		          $i.each(data.periods, function (index, period) {

		            var parent = $i('.jqs-day', $ithis.element).eq(data.day);
		            var options = {};
		            var height, position;
		            if ($i.isArray(period)) {
		              position = $ithis.positionFormat(period[0]);
		              height = $ithis.positionFormat(period[1]);
		            } else {
		              position = $ithis.positionFormat(period.start);
		              height = $ithis.positionFormat(period.end);
		              options = period;
		            }

		            if (height === 0) {
		              height = $ithis.periodHeight;
		            }

		            $ithis.add(parent, position, height - position, options);
		          });
		        });
		      }
		    },

		    /**
		     * Add a period to a day
		     * @param parent
		     * @param {int} position
		     * @param {int} height
		     * @param options
		     */
		    add: function (parent, position, height, options) {

		      if (height <= 0 || position >= this.periodHeight) {
		        console.error('Invalid period');

		        return false;
		      }

		      options = $i.extend({}, this.periodOptions, options);

		      // new period
		      var periodRemove = '';
		      var periodDuplicate = '';
		      if (this.settings.mode === 'edit') {
		        periodRemove = '<div class="jqs-period-remove" title="' + this.settings.periodRemoveButton + '"></div>';
		        periodDuplicate = '<div class="jqs-period-duplicate" title="' + this.settings.periodDuplicateButton +
		          '"></div>';
		      }

		      var periodTitle = '<div class="jqs-period-title">' + options.title + '</div>';
		      var periodTime = '<div class="jqs-period-time">' + this.periodInit(position, position + height) + '</div>';
		      var period = $i('<div class="jqs-period">' +
		        '<div class="jqs-period-container">' + periodTime + periodTitle + periodRemove + periodDuplicate + '</div>' +
		        '</div>').css({
		        'top': position * this.periodPosition,
		        'height': height * this.periodPosition
		      }).attr('id', this.uniqId()).attr('title', options.title).appendTo(parent);

		      $i('.jqs-period-container', period).css({
		        'background-color': options.backgroundColor,
		        'border-color': options.borderColor,
		        'color': options.textColor
		      });

		      // period validation
		      if (!this.isValid(period)) {
		        console.error('Invalid period', this.periodInit(position, position + height));

		        $i(period).remove();

		        return false;
		      }

		      // text format
		      this.periodText(period);

		      // period events
		      if (this.settings.mode === 'edit') {
		        var $ithis = this;

		        period.draggable({
		          grid: [0, this.periodPosition],
		          containment: 'parent',
		          drag: function (event, ui) {
		            $i('.jqs-period-time', ui.helper).text($ithis.periodDrag(ui));
		            $ithis.closeOptions();
		          },
		          stop: function (event, ui) {
		            if (!$ithis.isValid($i(ui.helper))) {
		              console.error('Invalid position');

		              $i(ui.helper).css('top', Math.round(ui.originalPosition.top));
		            }
		          }
		        }).resizable({
		          grid: [0, this.periodPosition],
		          containment: 'parent',
		          handles: 'n, s',
		          resize: function (event, ui) {
		            $i('.jqs-period-time', ui.helper).text($ithis.periodResize(ui));

		            $ithis.periodText(period);
		            $ithis.closeOptions();
		          },
		          stop: function (event, ui) {
		            if (!$ithis.isValid($i(ui.helper))) {
		              console.error('Invalid position');

		              $i(ui.helper).css({
		                'height': Math.round(ui.originalSize.height),
		                'top': Math.round(ui.originalPosition.top)
		              });
		            }
		          }
		        });

		        if (this.settings.periodOptions) {
		          period.click(function (event) {
		            if (
		              !$i(event.target).hasClass('jqs-period-remove') ||
		              !$i(event.target).hasClass('jqs-period-duplicate')
		            ) {
		              $ithis.settings.onClickPeriod.call(this, event, period, $ithis.element);
		              $ithis.openOptions(event, period);
		            }
		          });
		        }
		      }

		      this.settings.onAddPeriod.call(this, period, this.element);

		      return true;
		    },

		    /**
		     * Remove a period
		     * @param period
		     */
		    remove: function (period) {
		      if (!this.settings.onRemovePeriod.call(this, period, this.element)) {
		        period.remove();
		        this.closeOptions();
		      }
		    },

		    /**
		     * Remove all periods in the parent container
		     * @param parent
		     */
		    removeAll: function (parent) {
		      var $ithis = this;
		      $i('.jqs-period', parent).each(function (index, period) {
		        $ithis.remove(period);
		      });
		    },

		    /**
		     * Duplicate a period
		     * @param period
		     */
		    duplicate: function (period) {
		      if (!this.settings.onDuplicatePeriod.call(this, period, this.element)) {
		        var options = this.periodData(period);
		        var position = Math.round(period.position().top / this.periodPosition);
		        var height = Math.round(period.height() / this.periodPosition);

		        var $ithis = this;
		        $i('.jqs-day', this.element).each(function (index, parent) {
		          $ithis.add(parent, position, height, options);
		        });

		        this.closeOptions();
		      }
		    },

		    /**
		     * Duplicate all periods in the parent container
		     * @param parent
		     */
		    duplicateAll: function (parent) {
		      var $ithis = this;
		      $i('.jqs-period', parent).each(function (index, period) {
		        $ithis.duplicate($i(period));
		      });
		    },

		    /**
		     * Open the options popup
		     * @param event
		     * @param period
		     */
		    openOptions: function (event, period) {
		      var $ithis = this;
		      $ithis.closeOptions();

		      // popup position
		      var maxHeight = 850;
		      var top = period.offset().top - $i(this.element).offset().top + $i(this.element).scrollTop() - 20;
		      if (top < 20) {
		        top = 20;
		      }
		      if (top > maxHeight) {
		        top = maxHeight;
		      }

		      var maxWidth = $i(this.element).width() - 290;
		      var left = period.offset().left - $i(this.element).offset().left + period.width() + 20;
		      if (left > maxWidth) {
		        left = left - 330 - period.width();
		      }

		      // time
		      var position = Math.round(period.position().top / this.periodPosition);
		      var height = Math.round(period.height() / this.periodPosition);
		      var time = '<div class="jqs-options-time">' + this.periodInit(position, position + height) + '</div>';

		      // title
		      var title = $i('jqs-period-title', period).text();
		      var titleInput = '<div class="jqs-options-title-container">' +
		        '<input type="text" placeholder="' + this.settings.periodTitlePlaceholder +
		        '" value="' + title + '" class="jqs-options-title"></div>';

		      // color
		      var colorInput = '';
		      if (this.settings.periodColors && this.settings.periodColors.length > 0) {
		        var colorText = (this.settings.hour === 12) ? '12pm' : '00:00';

		        colorInput = '<div class="jqs-options-color-container">';
		        $i.each(this.settings.periodColors, function (index, color) {
		          colorInput += '<button class="jqs-options-color" ' +
		            'style="background-color: ' + color[0] + '; border-color: ' + color[1] + '; color:' + color[2] + '">' +
		            colorText + '</button>';
		        });
		        colorInput += '</div>';
		      }

		      // button
		      var remove = '<div class="jqs-options-remove">' + this.settings.periodRemoveButton + '</div>';
		      var duplicate = '<div class="jqs-options-duplicate">' + this.settings.periodDuplicateButton + '</div>';
		      var close = '<div class="jqs-options-close"></div>';
		      $i('<div class="jqs-options">' + time + titleInput + colorInput + remove + duplicate + close + '</div>').css({
		        top: top,
		        left: left
		      }).appendTo(this.element);

		      $i('.jqs-options-color', this.element).click(function () {
		        $i('.jqs-period-container', period).css({
		          'background-color': $i(this).css('background-color'),
		          'border-color': $i(this).css('border-top-color'),
		          'color': $i(this).css('color')
		        });
		      });

		      $i('.jqs-options-title', this.element).keyup(function () {
		        $i('.jqs-period-title', period).text($i(this).val());
		        period.attr('title', $i(this).val());
		      });

		      $i('.jqs-options-remove', this.element).click(function () {
		        $ithis.remove(period);
		      });

		      $i('.jqs-options-duplicate', this.element).click(function () {
		        $ithis.duplicate(period);
		      });

		      $i('.jqs-options-close', this.element).click(function () {
		        $ithis.closeOptions();
		      });
		    },

		    /**
		     * Close the options popup
		     */
		    closeOptions: function () {
		      $i('.jqs-options', this.element).remove();
		    },

		    /**
		     * Return a readable period string from a period position
		     * @param start
		     * @param end
		     * @returns {string}
		     */
		    periodInit: function (start, end) {
		      return this.periodFormat(start) + ' - ' + this.periodFormat(end);
		    },

		    /**
		     * Return a readable period string from a drag event
		     * @param ui
		     * @returns {string}
		     */
		    periodDrag: function (ui) {
		      var start = Math.round(ui.position.top / this.periodPosition);
		      var end = Math.round(($i(ui.helper).height() + ui.position.top) / this.periodPosition);

		      return this.periodFormat(start) + ' - ' + this.periodFormat(end);
		    },

		    /**
		     * Return a readable period string from a resize event
		     * @param ui
		     * @returns {string}
		     */
		    periodResize: function (ui) {
		      var start = Math.round(ui.position.top / this.periodPosition);
		      var end = Math.round((ui.size.height + ui.position.top) / this.periodPosition);

		      return this.periodFormat(start) + ' - ' + this.periodFormat(end);
		    },

		    /**
		     *
		     * @param period
		     */
		    periodText: function (period) {
		      var height = period.height();
		      period.removeClass('jqs-period-15').removeClass('jqs-period-30');

		      if (height === 10) {
		        period.addClass('jqs-period-15');
		        return false;
		      }

		      if (height === 20) {
		        period.addClass('jqs-period-30');
		        return false;
		      }

		      var newHeight = Math.floor((height - 16 - 4) / 12) * 12;
		      $i('.jqs-period-title', period).height(newHeight);
		    },

		    /**
		     * Return an object with all period data
		     * @param period
		     * @returns {[*,*]}
		     */
		    periodData: function (period) {
		      var start = Math.round(period.position().top / this.periodPosition);
		      var end = Math.round((period.height() + period.position().top) / this.periodPosition);

		      return {
		        start: this.periodFormat(start),
		        end: this.periodFormat(end),
		        title: $i('.jqs-period-title', period).text(),
		        backgroundColor: $i('.jqs-period-container', period).css('background-color'),
		        borderColor: $i('.jqs-period-container', period).css('border-top-color'),
		        textColor: $i('.jqs-period-container', period).css('color')
		      };
		    },

		    /**
		     * Return a readable hour from a position
		     * @param position
		     * @returns {number}
		     */
		    periodFormat: function (position) {
		      if (position >= this.periodHeight) {
		        position = 0;
		      }

		      if (position < 0) {
		        position = 0;
		      }

		      var hour = Math.floor(position / this.periodInterval);
		      var mn = (position / this.periodInterval - hour) * 60;

		      if (this.settings.hour === 12) {
		        var time = hour;
		        var ind = '';

		        if (hour >= 12) {
		          ind = 'p';
		        }
		        if (hour > 12) {
		          time = hour - 12;
		        }
		        if (hour === 0 || hour === 24) {
		          ind = '';
		          time = 12;
		        }
		        if (mn !== 0) {
		          time += ':' + mn;
		        }

		        return time + ind;
		      }

		      if (hour < 10) {
		        hour = '0' + hour;
		      }
		      if (mn < 10) {
		        mn = '0' + mn;
		      }

		      return hour + ':' + mn;
		    },

		    /**
		     * Return a position from a readable hour
		     * @param time
		     * @returns {number}
		     */
		    positionFormat: function (time) {
		      var split = time.split(':');
		      var hour = parseInt(split[0]);
		      var mn = parseInt(split[1]);

		      if (this.settings.hour === 12) {
		        var matches = time.match(/([0-1]?[0-9]):?([0-5][0-9])?\s?(am|pm|p)?/);
		        var ind = matches[3];
		        if (!ind) {
		          ind = 'am';
		        }

		        hour = parseInt(matches[1]);
		        mn = parseInt(matches[2]);

		        if (!mn) {
		          mn = 0;
		        }

		        if (hour === 12 && ind === 'am') {
		          hour = 0;
		        }
		        if (hour === 12 && (ind === 'pm' || ind === 'p')) {
		          ind = 'am';
		        }
		        if (ind === 'pm' || ind === 'p') {
		          hour += 12;
		        }
		      }

		      var position = 0;
		      position += hour * this.periodInterval;
		      position += mn / 60 * this.periodInterval;

		      if (Math.floor(position) !== position) {
		        return -1;
		      }

		      return position;
		    },

		    /**
		     * Return a hour to readable format (Grid structure)
		     * @param hour
		     * @returns {string}
		     */
		    formatHour: function (hour) {
		      if (this.settings.hour === 12) {
		        switch (hour) {
		          case 0:
		          case 24:
		            hour = '12am';
		            break;
		          case 12:
		            hour = '12pm';
		            break;
		          default:
		            if (hour > 12) {
		              hour = (hour - 12) + 'pm';
		            } else {
		              hour += 'am';
		            }
		        }
		      } else {
		        if (hour >= 24) {
		          hour = 0;
		        }

		        if (hour < 10) {
		          hour = '0' + hour;
		        }
		        hour += ':00';
		      }

		      return hour;
		    },

		    /**
		     * Check if a period is valid
		     * @param current
		     * @returns {boolean}
		     */
		    isValid: function (current) {
		      var currentStart = Math.round(current.position().top);
		      var currentEnd = Math.round(current.position().top + current.height());

		      var start = 0;
		      var end = 0;
		      var check = true;
		      $i('.jqs-period', $i(current).parent()).each(function (index, period) {
		        if (current.attr('id') !== $i(period).attr('id')) {
		          start = Math.round($i(period).position().top);
		          end = Math.round($i(period).position().top + $i(period).height());

		          if (start > currentStart && start < currentEnd) {
		            check = false;
		          }

		          if (end > currentStart && end < currentEnd) {
		            check = false;
		          }

		          if (start < currentStart && end > currentEnd) {
		            check = false;
		          }

		          if (start === currentStart || end === currentEnd) {
		            check = false;
		          }
		        }
		      });

		      return check;
		    },

		    /**
		     * Export data to JSON string
		     * @returns {string}
		     */
		    export: function () {
		      var $ithis = this;
		      var data = [];

		      $i('.jqs-day', $ithis.element).each(function (index, day) {
		        var periods = [];
		        $i('.jqs-period', day).each(function (index, period) {
		          periods.push($ithis.periodData($i(period)));
		        });

		        data.push({
		          day: index,
		          periods: periods
		        });
		      });

		      return JSON.stringify(data);
		    },

		    /**
		     * Import data on plugin init
		     * @param args
		     * @returns {Array}
		     */
		     
		    import: function (args) {
		      var $ithis = this;
		      var dataImport = args[1];
		      var ret = [];
		      $i.each(dataImport, function (index, data) {
		        $i.each(data.periods, function (index, period) {
		          var parent = $i('.jqs-day', $ithis.element).eq(data.day);
		          var options = {};
		          var height, position;
		          if ($i.isArray(period)) {
		            position = $ithis.positionFormat(period[0]);
		            height = $ithis.positionFormat(period[1]);
		          } else {
		            position = $ithis.positionFormat(period.start);
		            height = $ithis.positionFormat(period.end);
		            options = period;
		          }

		          if (height === 0) {
		            height = $ithis.periodHeight;
		          }

		          var status = true;
		          if (!$ithis.add(parent, position, height - position, options)) {
		            status = false;
		          }

		          ret.push({
		            day: data.day,
		            period: [
		              $ithis.periodFormat(position),
		              $ithis.periodFormat(height)
		            ],
		            status: status
		          });
		        });
		      });

		      return JSON.stringify(ret);
		    },

		    /**
		     * Remove all periods
		     */
		    reset: function () {
		      this.removeAll(this.element);
		    }
		  });

		  $i.fn[pluginName] = function (options) {
		    var ret = false;
		    var args = Array.prototype.slice.call(arguments);
		    var loop = this.each(function () {
		      if (!$i.data(this, 'plugin_' + pluginName)) {
		        $i.data(this, 'plugin_' + pluginName, new Plugin(this, options));
		      } else if ($i.isFunction(Plugin.prototype[options])) {
		        ret = $i.data(this, 'plugin_' + pluginName)[options](args);
		      }
		    });

		    if (ret) {
		      return ret;
		    }

		    return loop;
		  };
	
		  
		})(jQuery, window, document);
		$i(function() {
			var data = "";
			console.log('${scheduleData}');
			if ('${scheduleData}' == 'emptyData') {
				data = [];
			} else {
				data = $
				{scheduleData
				}
				;
			}
			$i('#schedule4')
					.jqs(
							{
								periodColors : [
										[ 'rgba(0, 0, 0, 0.5)', '#000',
												'#fff' ],
										[ 'rgba(200, 0, 0, 0.5)',
												'#f00', '#000' ],
										[ 'rgba(0, 200, 0, 0.5)',
												'#0f0', '#000' ],
										[ 'rgba(0, 0, 200, 0.5)',
												'#00f', '#000' ] ],
								data : data,
								periodTitle : 'No title',
								periodBackgroundColor : 'rgba(0, 0, 0, 0.5)',
								periodBorderColor : '#000',
								periodTextColor : '#fff',
								periodRemoveButton : '제거하기',
								periodTitlePlaceholder : '제목을 입력해주세요.'

							});
		});
	  
	 $i("#scheduleSaveBtn").click(function(){
			var scheduleData = $i("#schedule4").jqs('export');
			$i.ajax({
				url : "blockScheduleSave.bl",
				type : "post",
				data : {
					scheduleData : scheduleData
				},
				success : function(data) {
					alert("시간표 Data 저장 성공..");
				},
				error : function() {
					console.log("에러 발생!");
				}
			})
			return false;
	 });

</script>
<head>
<style>
.jqs-grid-line:before {
	left: 0;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="col-xs-12 col-md-12" align="left">
		<div class="panel panel-default col-xs-11 col-md-11 "
			style="margin-left: 50px; margin-right: 50px">
			<div class="panel-body" align="left" style="font-weight: bold">
				시간표 차단을 설정합니다. 일부 설정은 프로그램을 재시작해야 정상 적용됩니다.</div>
		</div>

		<h4 align="left" style="display: inline-block; left: 0">
			<span style="color: red; margin-top: 20px; margin-left: 50px">*</span>
			시간표 차단 설정
		</h4>

		<button type="button"
			style="display: inline-block; margin-left: 30px; margin-bottom: 20px"
			id="scheduleSaveBtn" class="btn btn-danger">저장 하기</button>
		<div class="col-xs-12 col-md-12" style="float: left">
			<div id="schedule4" class="jqs-demo mb-3"
				style="height: 400px; border: none"></div>
			<script>
				/* $(function() {
					var data = "";
					if ('${scheduleData}' == 'emptyData') {
						data = [];
					} else {
						data = $
						{
							scheduleData
						}
						;
					}
					$('#schedule4')
							.jqs(
									{
										periodColors : [
												[ 'rgba(0, 0, 0, 0.5)', '#000',
														'#fff' ],
												[ 'rgba(200, 0, 0, 0.5)',
														'#f00', '#000' ],
												[ 'rgba(0, 200, 0, 0.5)',
														'#0f0', '#000' ],
												[ 'rgba(0, 0, 200, 0.5)',
														'#00f', '#000' ] ],
										data : data,
										periodTitle : 'No title',
										periodBackgroundColor : 'rgba(0, 0, 0, 0.5)',
										periodBorderColor : '#000',
										periodTextColor : '#fff',
										periodRemoveButton : '제거하기',
										periodTitlePlaceholder : '제목을 입력해주세요.'

									});
				}); */
			</script>

			<script>
				function saveScheduleData() {
					var scheduleData = $("#schedule4").jqs('export');
					$.ajax({
						url : "blockScheduleSave.bl",
						type : "post",
						data : {
							scheduleData : scheduleData
						},
						success : function(data) {
							alert("시간표 Data 저장 성공..");
						},
						error : function() {
							console.log("에러 발생!");
						}
					})
					return false;
				}
			</script>
		</div>
	</div>
</body>
</html>